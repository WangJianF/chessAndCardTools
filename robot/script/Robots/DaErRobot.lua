local MessageCfg   = require("script.conf.MessageCfg")

MUST_HAND_OUT_RATE = 100
local EnterRoomDelay = 0

local Robot = class("Robot", sington)

function Robot:ctor(idx, id, roomid)
    log("Robot", "new robot idx: ", idx, " id: ", id, " roomid: ", roomid)
    self.idx = idx
    self.roomid = roomid
    self.id = id
    self.msgHandlers = {}
    self.info = {}

    self:login()

    self:startHeartbeat()

    self:initGameData()

    self:initGameListeners()

    self.taskCount = 0
end

function Robot:initGameData()
    self.timeLimit = 0
    self.playerId = 0
    self.mainCard = 0
    self.cards = nil
    self.opId = 0
    self.lastHand = nil
    self.promptIdx = 1
end

function Robot:startHeartbeat()
    schedule("robot_heartbeat_" .. self.idx, G_HEARTBEAT_TIME-2, G_HEARTBEAT_TIME, function()
        self:request("Heartbeat", "", handler(self, self.onHeartbeat))
        log("Robot", string.format("robot(idx: %d) Heartbeat 111.", self.idx), os.time())
    end)
end

function Robot:onHeartbeat(cmd, str)
    self.count = self.count or 1
    self.count = self.count + 1
    log("Robot", string.format("robot(idx: %d) onHeartbeat 222", self.idx), os.time())
end

function Robot:clear()
    log("Robot", string.format("robot(idx: %d, PlayerId: %s) clear.", self.idx, self.info.PlayerId))
    unschedule("robot_heartbeat_" .. self.idx)
    for i=1, self.taskCount do
        unschedule(self.id .. "delaytask" .. i)
    end
    self:clearGameListeners()
end

function Robot:exit()
    log("Robot", "exit()")
    robotExit(G_ROBOT_MGR_IDX, self.idx)
end

function Robot:request(cmd, str, cb)
    if not MessageCfg[cmd] then
        log("Robot", "request error: couldn't find cmd: " .. cmd)
        return
    end
    if not MessageCfg[cmd].req then
        log("Robot", "request error: couldn't find cmd: " .. cmd)
        return
    end

    if MessageCfg[cmd].rsp then
        self.msgHandlers[MessageCfg[cmd].rsp] = cb
    end
    log("Robot", string.format("robot(idx: %d) request, cmd: %s-%d, data: %s.", self.idx, cmd, MessageCfg[cmd].req, str))
    sendData(self.idx, MessageCfg[cmd].req, str)
end

function Robot:addMsgListener(cmd, cb)
    if not MessageCfg[cmd] then
        log("Robot", "request error: couldn't find cmd: " .. cmd)
        return
    end
    if not MessageCfg[cmd].notify then
        log("Robot", "request error: couldn't find cmd: " .. cmd)
        return
    end

    log("Robot", string.format("addMsgListener cmd: %s-%d, cb: %s", cmd, MessageCfg[cmd].notify, type(cb)))
    self.msgHandlers[MessageCfg[cmd].notify] = cb
end

function Robot:removeMsgListener(cmd)
    if not MessageCfg[cmd] then
        log("Robot", "request error: couldn't find cmd: " .. cmd)
        return
    end
    if not MessageCfg[cmd].rsp then
        log("Robot", "request error: couldn't find cmd: " .. cmd)
        return
    end

    self.msgHandlers[MessageCfg[cmd].rsp] = nil
end

function Robot:onMsg(cmd, str)
    local cb = self.msgHandlers[cmd]
    if cb then
        cb(cmd, str)
    else
        log("Robot", "onMsg ----- no handler", cmd, str)
    end
end

function Robot:getGamerById(id)
    for i, v in ipairs(self.gamers) do
        if v.PlayerId == id then
            return v, i
        end
    end
    return nil, nil
end

function Robot:login()
    local data = {Thirdparty = 0, ID = self.id, Platform = "win",}    
    local s = json.encode(data)
    self:request("Login", s, handler(self, self.onLoginRsp))
end

function Robot:onLoginRsp(cmd, str)
    local data = json.decode(str)
    self.info = data
    self.playerId = self.info.UserID
    local robot = self
    print("...... reqEnterRoom timer ", "enter" .. robot.idx)
    scheduleOnce("enter" .. robot.idx, EnterRoomDelay, function()
        robot:reqEnterRoom(self.roomid)
    end)
end

function Robot:reqEnterRoom(roomID)
    print("--- reqEnterRoom", roomID, type(roomID))
    local req = {RoomID = roomID, GPS = {lat = 0, lon = 0}}
    self:request("EnterRoom", json.encode(req), handler(self, self.onEnterRoomRsp))
end

function Robot:onEnterRoomRsp(cmd, str)
    self.roomInfo = json.decode(str)
    dump(self.roomInfo, "self.roomInfo:")
end

function Robot:reqPlayHand(card)
    local data = {Card = card}
    self:request("PlayHand", json.encode(data), handler(self, self.onPlayHandRsp))
end

function Robot:onPlayHandRsp(cmd, str)
   print("onPlayHandRsp:")
   table.remove(self.cards.StandCards, self.handoutCardIdx)
end

function Robot:onPlayHandBroad(cmd, str)
    local data = json.decode(str)
    dump(data, "onPlayHandBroad:")
end

function Robot:onPlayHandNotify(cmd, str)
    dump(data, "onPlayHandNotify:")
    self.handoutCardIdx = math.random(1,#self.cards.StandCards)
    local card = self.cards.StandCards[self.handoutCardIdx]
    self:reqPlayHand(card)
end

function Robot:onNewCardNotify(cmd, str)
   local data = json.decode(str)
   dump(data, "onNewCardNotify:")
   self.LeftCardsNum = data.LeftCardsNum
   if data.ID == self.id then
       table.insert(self.cards.StandCards, data.Card)
       self.handoutCardIdx = math.random(1,#self.cards.StandCards)
       local card = self.cards.StandCards[self.handoutCardIdx]
       self:reqPlayHand(card)
    end
end

function Robot:onActionNotify(cmd, str)
    local data = json.decode(str)
    dump(data, "onActionNotify:")
    local flag = true
    for _, v in pairs(data.Actions) do
        if v.OP == 6 and self.LeftCardsNum <= 4 then
            flag = false
            self:request("HuPai", "", function(cmd, str)
            end)
        end
    end 
    if flag then
        self:request("Pass", "", function(cmd, str)

        end)
    end
end

function Robot:onNewCardAction(cmd, str)
    local data = json.decode(str)
    self.LeftCardsNum = data.LeftCardsNum
    dump(data, "onNewCardAction:")
    if data.ID == self.id then
        table.insert(self.cards.StandCards, data.Card)
        local flag = true
        for _, v in pairs(data.Actions) do
            if v.OP == 6 and self.LeftCardsNum <= 4 then
                flag = false
                self:request("HuPai", "", function(cmd, str)end)
            end
        end
        if flag then
            self:request("Pass", "", function(cmd, str)
                if str == "" then
                    self.handoutCardIdx = math.random(1,#self.cards.StandCards)
                    local card = self.cards.StandCards[self.handoutCardIdx]
                    self:reqPlayHand(card)
                end
            end)
        end
    end
end

function Robot:onAccountOne(cmd, str)
    print("onAccountOne:")
    self:request("ReadyNext", "", function(cmd, str)

    end)
end

function Robot:onAccountAll(cmd, str)
    print("onAccountAll:")
        self:exit()
end

function Robot:onBroadPeng(cmd, str)
    print("onBroadPeng:", str)
end

function Robot:onBroadPass(cmd, str)
    print("onBroadPass:", str)
end

function Robot:onBroadGang(cmd, str)
    print("onBroadGang:", str)
end

function Robot:onBroadHuPai(cmd, str)
    print("onBroadHuPai:", str)
end

-------------------- listeners --------------------
function Robot:initGameListeners()
    self:addMsgListener("EnterRoom", handler(self, self.onPlayerIn))
    self:addMsgListener("GameStart", handler(self, self.onGameStart))
    self:addMsgListener("SelectLack", handler(self, self.onSelectLackNotify))
    self:addMsgListener("BroadPlayHand", handler(self, self.onPlayHandBroad))
    self:addMsgListener("PlayHand", handler(self, self.onPlayHandNotify))
    self:addMsgListener("NewCard", handler(self, self.onNewCardNotify))
    self:addMsgListener("Action", handler(self, self.onActionNotify))
    self:addMsgListener("NewCardAction", handler(self, self.onNewCardAction))
    self:addMsgListener("AccountOne", handler(self, self.onAccountOne))
    self:addMsgListener("AccountAll", handler(self, self.onAccountAll))
    self:addMsgListener("BroadPeng", handler(self, self.onBroadPeng))
    self:addMsgListener("BroadPass", handler(self, self.onBroadPass))
    self:addMsgListener("BroadGang", handler(self, self.onBroadGang))
    self:addMsgListener("BroadHuPai", handler(self, self.onBroadHuPai))
    
    
end

function Robot:clearGameListeners()
    self:removeMsgListener("EnterRoom")
    self:removeMsgListener("GameStart")
    self:removeMsgListener("SelectLack")
    self:removeMsgListener("BroadPlayHand")
    self:removeMsgListener("NewCard")
    self:removeMsgListener("Action")
    self:removeMsgListener("NewCardAction")
    self:removeMsgListener("AccountOne")
    self:removeMsgListener("AccountAll")
    self:removeMsgListener("BroadPeng")
    self:removeMsgListener("BroadPass")
    self:removeMsgListener("BroadGang")
    self:removeMsgListener("BroadHuPai")
    
end



function Robot:onGameStart(cmd, str)
    local data = json.decode(str)
    dump(data, "onGameStart:")
    self.currPlayerID = data.CurrPlayerID
    self.cards = data.SelfCardsInfo
    local t = {[1] = {}, [2] = {}, [3] = {}}
    local minIdx = 1
    for k, v in pairs(self.cards.StandCards) do
        local idx = math.floor(v/100)
        table.insert(t[idx], v)
    end
    if #t[2] < #t[minIdx] then
        minIdx = 2
    end
    if #t[3] < #t[minIdx] then
        minIdx = 3
    end

    self:reqSelectLack(minIdx)
end


function Robot:chat(msgId, minDelay, maxDelay)
    local cahtMsg = { MessageId = msgId } -- kuai dian kuai dian,deng de hua dou xie le
    local cahtStr = json.encode(cahtMsg)
    return self:delayTask(minDelay or 1, maxDelay or 3, function()
        self:request("ChatNotify", cahtStr, handler(self, self.onChatBroadcast))
    end)
end

function Robot:onPlayerIn(cmd, str)
    local data = json.decode(str)
    dump(data, "onPlayerIn:")
end


-------------------- actions --------------------
function Robot:delayTask(minDelay, maxDelay, cb)
    local delay = math.random(minDelay, maxDelay)
    self.taskCount = self.taskCount + 1
    scheduleOnce(self.id .. "delaytask" .. self.taskCount, delay, cb)
    return self.id .. "delaytask" .. self.taskCount
end

function Robot:pass()
    -- local data = 
    -- {
    --     OpId = self.opId,
    --     Cards = {},
    -- }
    -- local s = json.encode(data)
    -- self:delayTask(1, 3, function()
    --     self:request("PlayHand", s, handler(self, self.onHandoutRsp))
    -- end)
    -- log("Robot", "pass")
end

return Robot

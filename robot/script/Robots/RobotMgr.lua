local MessageCfg   = require("script.conf.MessageCfg")

RobotMgr = class("RobotMgr", sington)

function RobotMgr:ctor()
	self.robots = {}
	self.robotsIdxIdMap = {}
	registMsgHandler(handler(RobotMgr, self.msgHandler))
end

function RobotMgr:newRobot(idx, roomid, gameType)
	if self.robotsIdxIdMap[idx] then
		assert(false, string.format("robot %d has exist!", idx))
	end
	local Robot
	print("++++++++++++++++++++", gameType, type(gameType))
	if gameType == "daer" then
		print("-------------------1")
		Robot = require("script.Robots.DaErRobot")
	elseif gameType == "sangong" then
		print("-------------------2")
		Robot = require("script.Robots.SanGongRobot")
	elseif gameType == "majiang" then
		print("-------------------3")
		Robot = require("script.Robots.MaJiangRobot")
	end
	print("-------------------4")
	local id = "robot_" .. os.time() .. "_" .. idx
	if not self.robots[id] then
		self.robots[id] = Robot.new(idx, id, roomid)
		self.robotsIdxIdMap[idx] = id
		print("RobotMgr.newRobot", idx, id, roomid, gameType)
	end
end

function RobotMgr:getRobotByID(id)
	return self.robots[id] 
end

function RobotMgr:deleRobot(idx)
	local id = self.robotsIdxIdMap[idx]
	print("RobotMgr.deleRobot", idx)
	if id then
		if self.robots[id] then
			self.robots[id]:clear()
		end
		self.robots[id] = nil
	end
	self.robotsIdxIdMap[idx] = nil
end

function RobotMgr:msgHandler(idx, cmd, str)
	local id = self.robotsIdxIdMap[idx]
	if id then
		if self.robots[id] then
			print("RobotMgr.msgHandler", idx, self:getCmdName(cmd), cmd, str)
			print("time = ", os.time())
			self.robots[id]:onMsg(cmd, str)
		else
			print("RobotMgr.msgHandler 222 couldn't find robot: ", idx, id)
		end
	else
		print("RobotMgr.msgHandler 333 couldn't find robot: ", idx)
	end
end

function RobotMgr:getCmdName(cmd)
	for k, v in pairs(MessageCfg) do
		if v.rsp == cmd or v.notify == cmd then
			return k
		end
	end
end

return RobotMgr
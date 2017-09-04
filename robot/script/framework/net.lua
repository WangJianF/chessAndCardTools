local connectCB = {}
local msgHandler = function(idx, cmd, msgstr) end
local msgRecvCount = 0

function registMsgHandler(h)
	msgHandler = h
end

local _sendData = sendData
function sendData(idx, cmd, str)
	_sendData(G_ROBOT_MGR_IDX, idx, cmd, str)
end

function onNewRobot(idx, roomid, gametype)
	print("--------- onNewRobot")
	if gRobotMgr then
		gRobotMgr:newRobot(idx, roomid, gametype)
	end

	return true
end

function onDeleRobot(idx)
	if gRobotMgr then
		gRobotMgr:deleRobot(idx)
	end

	return true
end

function onMsg(idx, cmd, msgstr)
	if idx == 0 then
		
		onTick()
	elseif gRobotMgr then
		gRobotMgr:msgHandler(idx, cmd, msgstr)
	end

	return true
end
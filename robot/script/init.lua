require("script.framework.json")
--md5 = require("script.framework.md5")
--mp = require("script.framework.MessagePack")

require("script.framework.log")
require("script.framework.net")
require("script.framework.timer")
require("script.framework.functions")
require("script.framework.eventCenter")

utf8 = require("script.framework.utf8")

require("script.Robots.RobotMgr")
require("script.config")

collectgarbage("setpause", G_COLLECT_PAUSE) 
collectgarbage("setstepmul", G_COLLECT_INTERNAL)

gRobotMgr = RobotMgr.new()

math.randomseed(os.time())

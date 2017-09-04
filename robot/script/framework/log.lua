local logtags =
{
	net = true,
	timer = true,
	traceback = true,
	eventCenter = true,
	CardPrompter = true,
	Robot = true,
	--RobotMgr = true,
}

function log(tag, ...)
	if logtags[tag] then
		print("[lua_print | " .. tag .. "]", ...)
	end
end

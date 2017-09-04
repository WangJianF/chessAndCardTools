local timers = {}

function unschedule(name)
	timers[name] = nil
end

function schedule(name, delay, internal, cb)
	timers[name] = 
	{
		start = os.clock(),
		delay = delay,
		internal = internal,
		cb = cb,
		active = false,
		calledtimes = 0,
	}
end

function scheduleOnce(name, delay, cb)
	log("timer", name, delay, cb)
	schedule(name, delay, 0, function()
		cb()
		unschedule(name)
	end)
end

function timerTick()
	local currtime = os.clock()
	for name, timer in pairs(timers) do
		if not timer.active then
			if (currtime - timer.start) > timer.delay then
				timer.start = currtime
				timer.cb()
				timer.active = true
				timer.calledtimes = timer.calledtimes + 1
			end
		else
			if (currtime - timer.start) > timer.internal then
				timer.start = currtime
				timer.cb()
				timer.calledtimes = timer.calledtimes + 1
			end
		end		
	end
end

function onTick()
	timerTick()
	return
end
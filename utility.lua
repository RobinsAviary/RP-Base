-- Utility

function stween(val, goal, amnt)
	return val + (goal - val) * amnt
end

function btndly(delay, freq)
	poke(0x5f5c, delay, freq) 
end

function scalartoperc(scalar)
	return sub(tostr(scalar * 100), 0, 5) .. "%"
end

function getramusage()
	return scalartoperc(stat(0)/2048)
end

function getdebuginfo()
	return "ram: " .. getramusage() .. "\ncpu: " ..  scalartoperc(stat(1))
end

function rndrng(mn, mx)
    return mn + rnd(mx - mn)
end

function clamp(val, mn, mx)
	local lower = val >= min
	local upper = val <= mx

	if lower and upper then 
		return val
	elseif lower == false then
		return lower
	else
		return upper
	end
end

function remap(lower1, upper1, lower2, upper2, value)
	return (scalar(lower1, upper1, value) * (upper2 - lower2)) + lower2
end

function scalar(lower, upper, value)
	return (value - lower) / (upper - lower)
end
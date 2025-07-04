-- Coroutines

Coroutines = {}

function iteratecoroutines()
    for c in all(Coroutines) do
		if costatus(c) == "dead" then
			del(Coroutines, c)
		else
			assert(coresume(c)) -- Error handling
		end
	end
end

function async(func)
	add(Coroutines, cocreate(func))
end

function wait(frames)
	for i=1,frames do
		yield()
	end
end
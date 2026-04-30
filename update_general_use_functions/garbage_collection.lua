--Copyright 2021 Max Cahill (Zlib license)
--
--This software is provided 'as-is', without any express or implied
--warranty. In no event will the authors be held liable for any damages
--arising from the use of this software.
--
--Permission is granted to anyone to use this software for any purpose,
--including commercial applications, and to alter it and redistribute it
--freely, subject to the following restrictions:
--
--1. The origin of this software must not be misrepresented; you must not
--   claim that you wrote the original software. If you use this software
--   in a product, an acknowledgment in the product documentation would be
--   appreciated but is not required.
--2. Altered source versions must be plainly marked as such, and must not be
--   misrepresented as being the original software.
--3. This notice may not be removed or altered from any source distribution.
--This function was slightly modified from it's original state
function set_nuGC(time_budget, memory_ceiling, disable_otherwise)
	time_budget = time_budget or 3e-4
	memory_ceiling = memory_ceiling or 300
	local max_steps = 1000
	local steps = 0
	local start_time = love.timer.getTime()
	while
		love.timer.getTime() - start_time < time_budget and
		steps < max_steps
	do
		collectgarbage("step", 1)
		steps = steps + 1
	end
	--safety net
	if collectgarbage("count") / 1024 > memory_ceiling then
		collectgarbage("collect")
	end
	--don't collect gc outside this margin
	if disable_otherwise then
		collectgarbage("stop")
	end
end
pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

t=0

function snow()
	if #snowflakes==0 then
		for i=0,100 do
			local flake={x=flr(rnd(127)),y=flr(rnd(127))}
			add(snowflakes,flake)
		end
	else
		for i=0,10 do
			local flake={x=flr(rnd(127)),y=0}
			add(snowflakes,flake)
		end
	end

	for flake in all(snowflakes) do
		flake.y+=1
		flake.x=sin(t)*10
		pset(flake.x, flake.y, 7) -- draw the flake

		if flake.y>127 then
			del(snowflakes, flake)
		end
	end
end

function _init()
	snowflakes={} -- the array for keeping track of an animating the snow
end

function _update()
	t=t+1 -- increment the clock
end

function _draw()
	cls() -- clear the screen
	snow() -- make it snow
end

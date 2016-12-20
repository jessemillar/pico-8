pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

t=0

function snow()
	if #snowflakes==0 then -- fill the screen with snowflakes
		for i=0,900 do
			local flake={x=flr(rnd(200)-36),y=flr(rnd(127))} -- place to the left and right of the screen so we don't see the edges of the sine wave
			add(snowflakes,flake)
		end
	else
		for i=0,3 do -- add a few flakes each frame
			local flake={x=flr(rnd(200)-36),y=0}
			add(snowflakes,flake)
		end
	end

	for flake in all(snowflakes) do
		if t%2<1 then -- slow the decent of flakes
			flake.y+=flr(rnd(2)+1)
		end

		flake.x+=cos(t/300)/5 -- make flakes float left and right
		pset(flake.x, flake.y, 7) -- draw the flake

		if flake.y>127 then -- if the flakes are outside the screen delete them
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

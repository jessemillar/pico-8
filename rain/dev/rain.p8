pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

t=0

function rain()
	if #raindrops==0 then -- fill the screen with raindrops
		for i=0,900 do
			local drop={x=flr(rnd(200)-36),y=flr(rnd(127))} -- place to the left and right of the screen so we don't see the edges of the sine wave
			add(raindrops,drop)
		end
	else
		for i=0,3 do -- add a few drops each frame
			local drop={x=flr(rnd(200)-36),y=0}
			add(raindrops,drop)
		end
	end

	for drop in all(raindrops) do
		if t%2<1 then -- slow the decent of drops
			drop.y+=flr(rnd(2)+1)
		end

		drop.x+=cos(t/300)/5 -- make drops float left and right
		pset(drop.x, drop.y, 7) -- draw the drop

		if drop.y>127 then -- if the drops are outside the screen delete them
			del(raindrops, drop)
		end
	end
end

function _init()
	raindrops={} -- the array for keeping track of an animating the rain
end

function _update()
	t=t+1 -- increment the clock
end

function _draw()
	cls() -- clear the screen
	rain() -- make it rain
end

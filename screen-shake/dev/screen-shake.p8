pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

t=0 -- the timer for keeping track of things

function shake(reset) -- shake the screen
	camera(0,0) -- reset to 0,0 before each shake so we don't drift

	if not reset then -- if the param is true, don't shake, just reset the screen to default
		camera(flr(rnd(10)-5),flr(rnd(10)-5)) -- define shake power here (-5 to shake equally in all directions)
	end
end

function _update()
	t=t+1 -- increment the clock
end

function _draw()
	cls() -- clear the screen
	rectfill(0,0,127,127,1) -- draw a rectangle so we can see the shakes
	shake() -- shake the screen
end

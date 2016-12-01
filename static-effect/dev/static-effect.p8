pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

t=0 -- the timer for keeping track of things

function static()
	local colors={1,5,13} -- define the colors involved in the static

	for i=0,63 do -- draw at every other line position for speed
		line(0,i*2,127,i*2,colors[flr(rnd(#colors+1))]) -- use horizontal lines to save cpu time
	end
end

function _update()
	t=t+1 -- increment the clock
end

function _draw()
	cls() -- clear the screen
	static() -- draw the static
end

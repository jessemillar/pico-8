pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

t=0

function draw_encoded(x, y, image)
	for y_index=0,image[2]-1 do
		local i=1 -- reset the index for each row

		for x_index=0,image[1]-1 do
			local row=image[y_index+3]
			local char = ""

			if sub(row, i+1, i+1)=="-" then
				char=sub(row, i, i)
				i+=2
			else
				char=sub(row, i, i+1)
				i+=3
			end

			local x_pos=x_index+x
			local y_pos=y_index+y

			if char=="0" then
				pset(x_pos, y_pos, 0)
			elseif char=="1" then
				pset(x_pos, y_pos, 1)
			elseif char=="2" then
				pset(x_pos, y_pos, 2)
			elseif char=="3" then
				pset(x_pos, y_pos, 3)
			elseif char=="4" then
				pset(x_pos, y_pos, 4)
			elseif char=="5" then
				pset(x_pos, y_pos, 5)
			elseif char=="6" then
				pset(x_pos, y_pos, 6)
			elseif char=="7" then
				pset(x_pos, y_pos, 7)
			elseif char=="8" then
				pset(x_pos, y_pos, 8)
			elseif char=="9" then
				pset(x_pos, y_pos, 9)
			elseif char=="10" then
				pset(x_pos, y_pos, 10)
			elseif char=="11" then
				pset(x_pos, y_pos, 11)
			elseif char=="12" then
				pset(x_pos, y_pos, 12)
			elseif char=="13" then
				pset(x_pos, y_pos, 13)
			elseif char=="14" then
				pset(x_pos, y_pos, 14)
			elseif char=="15" then
				pset(x_pos, y_pos, 15)
			end
		end
	end
end

function _init()
	test={ -- the string representing the full-page image
		128,
		2,
		"2-2-2-0-2-2-2-2-1-1-1-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-",
		"3-3-3-3-3-3-3-3-2-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-3-",
	} 
end

function _update()
	t=t+1 -- increment the clock
end

function _draw()
	cls() -- clear the screen
	draw_encoded(0, 0, test) -- draw the test image
end

pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

t=0

function draw_encoded(x, y, image)
	for y_index=0,image[2] do
		local i=1 -- reset the index for each row

		for x_index=0,image[1] do
			local row=image[y_index+3]
			local char = ""

			if sub(row, i+1, i+1)=="-" then
				char=sub(row, i, i)
				i+=1
			else
				char=sub(row, i, i+1)
				i+=2
			end

			if char=="0" then
				pset(x_index+x, y_index+y, 0)
			elseif char=="1" then
				pset(x_index+x, y_index+y, 1)
			elseif char=="2" then
				pset(x_index+x, y_index+y, 2)
			elseif char=="3" then
				pset(x_index+x, y_index+y, 3)
			elseif char=="4" then
				pset(x_index+x, y_index+y, 4)
			elseif char=="5" then
				pset(x_index+x, y_index+y, 5)
			elseif char=="6" then
				pset(x_index+x, y_index+y, 6)
			elseif char=="7" then
				pset(x_index+x, y_index+y, 7)
			elseif char=="8" then
				pset(x_index+x, y_index+y, 8)
			elseif char=="9" then
				pset(x_index+x, y_index+y, 9)
			elseif char=="10" then
				pset(x_index+x, y_index+y, 10)
			elseif char=="11" then
				pset(x_index+x, y_index+y, 11)
			elseif char=="12" then
				pset(x_index+x, y_index+y, 12)
			elseif char=="13" then
				pset(x_index+x, y_index+y, 13)
			elseif char=="14" then
				pset(x_index+x, y_index+y, 14)
			elseif char=="15" then
				pset(x_index+x, y_index+y, 15)
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

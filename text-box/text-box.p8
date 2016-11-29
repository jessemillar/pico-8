pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

t=0 -- the timer for keeping track of things

-- add a new text box
-- could be simplified to use less tokens but left verbose in the name of education
function tbox(message)
	local text_color=7 -- white text 
	local fill_color=1 -- blue inner fill
	local border_color=7 -- white border
	local x=4
	local y=88
	local width=127-x*2
	local height=35
	local border_thickness=2
	local padding=5

	rectfill(x, y, x+width, y+height, border_color) -- draw border rectangle
	rectfill(x+border_thickness, y+border_thickness, x+width-border_thickness, y+height-border_thickness, fill_color) -- draw fill rectangle
	line(x+border_thickness, y+border_thickness, x+width-border_thickness, y+border_thickness, 6) -- draw top border shadow 
	line(x, y+height+border_thickness/2, x+width, y+height+border_thickness/2, 6) -- draw bottom border shadow 

	local line_number=0 -- keep track of which line we're on for line breaks
	local split_character=0 -- the character we split the string at to enable line breaks

	if(#message*8>width-border_thickness-padding) then
	else
		print(message, x+padding, y+padding+1, text_color) -- print the message (with padding+1 in the y direction to account for the fancy top border shadow)
	end
end

function _init()
	tboxes={} -- the array for keeping track of text box overflows
end

function _update()
	t=t+1 -- increment the clock
end

function _draw()
	cls() -- clear the screen
	rectfill(0, 0, 128, 128, 3) -- fill the screen for size testing purposes
	tbox("this is a test super long test that should test overflow abilities") -- draw a test box
end

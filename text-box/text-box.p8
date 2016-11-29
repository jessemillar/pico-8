pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

t=0 -- the timer for keeping track of things

-- Add a new text box
function tbox(message, text_color, fill_color, border_color, x, y, width, height, border_thickness)
	local text_color=text_color or 7 -- white text color by default
	local fill_color=fill_color or 1 -- blue inner color by default
	local border_color=border_color or 7 -- white border color by default
	local x=x or 5
	local y=y or 88
	local width=width or 118
	local height=height or 35
	local border_thickness=border_thickness or 2 -- 2 pixel border thickness by default

	rectfill(x, y, x+width, y+height, border_color) -- draw border rectangle
	rectfill(x+border_thickness, y+border_thickness, x+width-border_thickness, y+height-border_thickness, fill_color) -- draw fill rectangle
	line(x+border_thickness, y+border_thickness, x+width-border_thickness, y+border_thickness, 6) -- draw top border shadow 
	line(x, y+height+border_thickness/2, x+width, y+height+border_thickness/2, 6) -- draw bottom border shadow 
	print(message, x+5, y+6, text_color) -- print the message
end

function _init()
	tboxes={} -- The array for keeping track of text boxes
end

function _update()
	t=t+1 -- increment the clock
end

function _draw()
	cls() -- clear the screen
	rectfill(0, 0, 128, 128, 3) -- fill the screen for size testing purposes
	tbox("this is a test") -- draw a test box
end

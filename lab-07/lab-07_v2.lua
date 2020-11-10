#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()


local wnd = gtk.Window
{
	title = 'lab-07_v2_Tsvetkov',
	on_delete_event = gtk.main_quit,
	gtk.Box
	{
		border_width = 4,
		spacing = 4,
		orientation = 'VERTICAL',
		gtk.DrawingArea
		{
			expand = true,
			id = 'canvas',
			width = 256,
			height = 256
		},
		gtk.Box
		{
			orientation = 'HORIZONTAL',
			spacing = 4,
			gtk.Button
			{
				id='button1',
				label = 'YEP'
			},
		gtk.Button
			{
				id='button2',
				label = 'NOP'
			}
}
}
}

local cnv = wnd.child.canvas
local btn1 = wnd.child.button1
local btn2 = wnd.child.button2

btnclick = 0


function btn1:on_clicked(...)
btnclick=1
cnv:queue_draw()
end

function btn2:on_clicked(...)
btnclick=2
cnv:queue_draw()
end



function cnv:on_draw(cr)
cr:set_source_rgb(1,1,1)
cr:paint()
if btnclick==1 then
	for x=1, 10 do
		for y=1, 10 do
			cr:set_source_rgb(x/10,y/10,0.75)
			cr:rectangle(x*15,y*15,10,10)
			cr:fill()
		end
	end
end
if btnclick==2 then
for x=1, 10 do
		for y=1, 10 do
			cr:set_source_rgb(x/10,y/10,0.25)
			cr:rectangle(x*15,y*15,10,10)
			cr:fill()
		end
	end
return true
end
end

wnd.title = 'lab-07_Tsvetkov'

wnd.on_destroy = gtk.main_quit
wnd:show_all()


gtk.main()


lgi=require 'lgi'
sqlite= require 'lsqlite3'

gtk=lgi.Gtk
pixbuf=lgi.GdkPixbuf.Pixbuf

gtk.init()


bld=gtk.Builder()
bld:add_from_file('lab-06.glade')
ui=bld.objects

rdr_txt=gtk.CellRendererText{}
rdr_pix=gtk.CellRendererPixbuf{}

c1=gtk.TreeViewColumn{title='Name', {rdr_txt,{text=1}}}
c2=gtk.TreeViewColumn{title='Value', {rdr_txt,{text=2}}}
c3=gtk.TreeViewColumn{title='Image', {rdr_pix,{pixbuf=3}}}

ui.list:append_column(c1)
ui.list:append_column(c2)
ui.list:append_column(c3)


f=io.popen('sqlite3 '.."lab-06"..'.db "'.."SELECT * FROM list"..'"')
while true do
local row = f:read('*l')
if row == nil then break end
local _, _, name, value, image = row:find('(%w+)|(%d+)|(.-)$')
px=pixbuf.new_from_file(image)
el=ui.store:append()
ui.store[el]={[1]=name,[2]=value,[3]=px}
end
f:close()
ui.wnd.title='lab-06_Zhukov-popen'
ui.wnd.on_destroy=gtk.main_quit
ui.wnd:show_all()
gtk.main()

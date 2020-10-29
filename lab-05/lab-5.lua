lgi=require 'lgi'
gtk=lgi.Gtk
gtk.init()


bld=gtk.Builder()
bld:add_from_file('lab-5.glade')
ui=bld.objects

function ui.open:on_clicked(...)
ui.wnd2:show_all()
end
function ui.close:on_clicked(...)
ui.wnd2:hide()
end
function ui.openm:on_clicked(...)
msg= gtk.MessageDialog
{
message_type=gtk.MessageType.INFO,
buttons=gtk.ButtonsType.OK,
text="hi,dude",
secondary_text="hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
}
msg:run()
msg:destroy()
end
ui.wnd.title='lab-5 Zhukov, window1'
ui.wnd2.title='lab-5 Zhukov, window2'
ui.wnd.on_destroy=gtk.main_quit
ui.wnd:show_all()
gtk.main()

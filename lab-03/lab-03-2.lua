lgi=require 'lgi'
gtk=lgi.Gtk
gdk=lgi.Gdk
gtk.init()

bld=gtk.Builder()
bld:add_from_file('lab-03-2.glade')
ui=bld.objects

prov=gtk.CssProvider()
prov:load_from_path('style.css')

ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr,prov,gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)
opt={ui.opt_a,ui.opt_b,ui.opt_c,ui.opt_d,ui.opt_e,ui.opt_f,ui.opt_g,ui.opt_h}
function titikaka()
ui.chk_x.active=false
ui.chk_y.active=false
ui.chk_z.active=false
ui.chk_d.active=false
num=tonumber(ui.entry.text)
str={}
for i=1,4 do
str[i]=math.fmod(num,2)
num=math.modf(num/2)
end
if str[4]==1 then ui.chk_x.active=true end
if str[3]==1 then ui.chk_y.active=true end
if str[2]==1 then ui.chk_z.active=true end
if str[1]==1 then ui.chk_d.active=true end
end
function ui.enter_btn:on_clicked(...)
titikaka()
end
ui.wnd.title='lab-03-2_Zhukov'
ui.wnd.on_destroy=gtk.main_quit
ui.wnd:show_all()
gtk.main()

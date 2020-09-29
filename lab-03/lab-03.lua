lgi=require 'lgi'
gtk=lgi.Gtk
gdk=lgi.Gdk
gtk.init()

bld=gtk.Builder()
bld:add_from_file('lab-03.glade')
ui=bld.objects

prov=gtk.CssProvider()
prov:load_from_path('style.css')

ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr,prov,gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)
opt={ui.opt_a,ui.opt_b,ui.opt_c,ui.opt_d,ui.opt_e,ui.opt_f,ui.opt_g,ui.opt_h}
function titikaka()
x=0
y=0
z=0
if ui.chk_x.active==true then x=1 end
if ui.chk_y.active==true then y=1 end
if ui.chk_z.active==true then z=1 end
v=x+y*2+z*4
opt[v+1].active=true
ui.value.label="Value "..v
end
function ui.chk_x:on_clicked(...)
titikaka()
end
function ui.chk_y:on_clicked(...)
titikaka()
end
function ui.chk_z:on_clicked(...)
titikaka()
end
ui.wnd.title='lab-03_Zhukov'
ui.wnd.on_destroy=gtk.main_quit
ui.wnd:show_all()
gtk.main()

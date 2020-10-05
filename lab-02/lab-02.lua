
lgi = require 'lgi'

gtk = lgi.Gtk
gdk=lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-02.glade')
ui = bld.objects

prov=gtk.CssProvider()
prov:load_from_path('style.css')

ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr,prov,gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

function ui.btn_sum:on_clicked(...)
a = tonumber(ui.text1.text)
b = tonumber(ui.text2.text)
ui.res.label = a+b
end

function ui.btn_sub:on_clicked(...)
a = tonumber(ui.text1.text)
b = tonumber(ui.text2.text)
ui.res.label = a-b
end

function ui.btn_multi:on_clicked(...)
a = tonumber(ui.text1.text)
b = tonumber(ui.text2.text)
ui.res.label = a*b
end

function ui.btn_div:on_clicked(...)
a = tonumber(ui.text1.text)
b = tonumber(ui.text2.text)
if (b == 0) then
ui.res.label = 'Error'
else
ui.res.label = a/b

end
end

function ui.btn_pow:on_clicked(...)
a = tonumber(ui.text1.text)
b = tonumber(ui.text2.text)

ui.res.label = a^b

end

function ui.btn_sqrt:on_clicked(...)
a = tonumber(ui.text1.text)
b = tonumber(ui.text2.text)
if (a<0) then
ui.res.label = 'Error'
else
ui.res.label = math.sqrt(a)

end
end


function ui.btn_log:on_clicked(...)
a = tonumber(ui.text1.text)
b = tonumber(ui.text2.text)
if (a<0) then
ui.res.label = 'Error'
else
ui.res.label = math.log10(a)

end
end

function ui.btn_sin:on_clicked(...)
a = tonumber(ui.text1.text)
b = tonumber(ui.text2.text)
ui.res.label = math.sin(a)
end

function ui.btn_cos:on_clicked(...)
a = tonumber(ui.text1.text)
b = tonumber(ui.text2.text)
ui.res.label = math.cos(a)
end

function ui.btn_tg:on_clicked(...)
a = tonumber(ui.text1.text)
b = tonumber(ui.text2.text)
ui.res.label = math.tan(a)
end
ui.calc.title = 'lab-02_Tsvetkov'
ui.calc.on_destroy = gtk.main_quit
ui.calc:show_all()

gtk.main()

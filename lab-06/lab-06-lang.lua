lgi=require 'lgi'
sqlite= require 'lsqlite3'

gtk=lgi.Gtk


gtk.init()


bld=gtk.Builder()
bld:add_from_file('lab-06-lang.glade')
ui=bld.objects

db = sqlite.open('lab-06-lang.db')

--заполнение комбобокса с работниками
for row in db:nrows('SELECT * FROM employee') do
el=ui.work:append()
ui.work[el]={[1]=row.name,[2]=row.rowid}
end

--заполнение комбобокса с языками
for row1 in db:nrows('SELECT * FROM language') do
el2=ui.lang:append()
ui.lang[el2]={[1]=row1.langname,[2]=row1.rowid}
end

--запрос на получение данных о выбранном работнике (список языков)
function ui.name:on_clicked(...)
db = sqlite.open('lab-06-lang.db')
if ui.workes.active > -1 then
rdr_txt=gtk.CellRendererText{}
curr =ui.workes.active+1
n="Language: "
for row in db:nrows('SELECT employee.name, language.langname FROM mapping INNER JOIN employee ON mapping.id=employee.rowid INNER JOIN language ON mapping.idlang=language.rowid WHERE mapping.id='..curr) do
n=n..row.langname.." "
end
ui.answer.label=n
db:close()
else
ui.answer.label="Выберите кого-нибудь"
end
end

--запрос на получение данных о выбранном языке (список работников)
function ui.lan:on_clicked(...)
db = sqlite.open('lab-06-lang.db')
if ui.language.active > -1 then
curr =ui.language.active+1
n="Name: "
for row in db:nrows('SELECT employee.name, language.langname FROM mapping INNER JOIN employee ON mapping.id=employee.rowid INNER JOIN language ON mapping.idlang=language.rowid WHERE mapping.idlang='..curr) do
n=n..row.name.." "
end
ui.answer.label=n
db:close()
else
ui.answer.label="Выберите кого-нибудь"
end
end


db:close()
ui.wnd.title='lab-06_Zhukov-lang'
ui.wnd.on_destroy=gtk.main_quit
ui.wnd:show_all()
gtk.main()

#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-01.glade')

ui = bld.objects

ui.Title.title = 'lab-01'
ui.Title.on_destroy = gtk.main_quit
ui.Title:show_all()

gtk.main()

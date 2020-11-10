#!/usr/bin/sh

rm  -f lab-06.db
cat lab-06-lang.sql | sqlite3 lab-06-lang.db
lua lab-06-lang.lua

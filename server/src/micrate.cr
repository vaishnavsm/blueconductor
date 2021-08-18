#! /usr/bin/env crystal
require "micrate"
require "sqlite3"

Micrate::DB.connection_url = "sqlite3:./data.sqlite3"
Micrate::Cli.run
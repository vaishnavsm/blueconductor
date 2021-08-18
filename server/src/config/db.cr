require "sqlite3"
require "granite/connections"
require "granite/adapter/sqlite"

Granite::Connections << Granite::Adapter::Sqlite.new(name: "db", url: "sqlite3:./data.sqlite3")

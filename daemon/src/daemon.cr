# TODO: Write documentation for `Daemon`

require "http/web_socket"

module Daemon
  VERSION = "0.1.0"
  ADDRESS = "http://localhost:3000"
  socket = HTTP::WebSocket.new(ADDRESS, "/abcd")
  # TODO: Put your code here
end

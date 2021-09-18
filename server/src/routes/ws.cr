require "kemal"
require "../models/host"
require "../services/commands"

ws "/:host_id" do |socket, ctx|
  host_id = ctx.ws_route_lookup.params["host_id"].as(String)
  host = User.find host_id
  if !host
    puts "No host associated with the given host_id #{host_id}"
    socket.send("no host with given host_id")
    socket.close
    next
  end
  
  register_host(host, socket)
  puts "Host #{host.name} has joined"
  
  socket.on_message do |message|
    on_host_event(host, message)
  end

  socket.on_close do |_|
    close_host(host, socket)
    puts "Host #{host.name} has left"
  end

end

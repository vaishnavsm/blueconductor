require "../models/host"
require "../models/device"
require "../models/connected"


class Controller
  
end

connected_map = Hash(string, Controller) # User -> Controller

def join(host : Host, connected_to )
  true
end

def connect(host : Host, device : Device)
  puts "Connect: #{host.name} to #{device.mac_id}"
  Connected.create! host_id: host.id, device_id: device.id, user_id: device.user!.id
end

def disconnect(host : Host, device : Device)
  puts "Disconnect #{host.name} from #{device.mac_id}"
  device.connected!.destroy
  if device.connected
    device.connected!.destroyed?
  else
    true
  end
end

def register_host(host : Host, socket : Http::WebSocket)

end

def on_host_event(host : Host, message : String)

end

def close_host(host : Host, socket : Http::WebSocket)

end
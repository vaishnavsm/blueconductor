require "kemal"
require "../services/commands"

get "/v1/connects" do |ctx|
  ctx.response.status = HTTP::Status::NOT_FOUND
  {"status": "error", "data": "not implemented"}
end


post "/v1/connects" do |ctx|
  host_id = ctx.params.json["host_id"].as(Int64)
  device_id = ctx.params.json["device_id"].as(Int64)
  
  device = Device.find device_id
  host = Host.find host_id

  if !device
    ctx.response.status = HTTP::Status::NOT_FOUND
    next {"status": "error", "data": "no such device"}.to_json
  end
  
  if !host
    ctx.response.status = HTTP::Status::NOT_FOUND
    next {"status": "error", "data": "no such host"}.to_json
  end

  if device.connected && device.connected!.host!.id == host.id
    ctx.response.status = HTTP::Status::NO_CONTENT
    next {"status": "success"}.to_json
  end

  if device.connected
    disconnect(device.connected!.host!, device)
    sleep 5.seconds
  end
  connect(host, device)

  ctx.response.status = HTTP::Status::OK
  {"status": "success", "data": "Switch Successful"}
end
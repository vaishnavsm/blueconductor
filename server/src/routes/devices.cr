require "../models/device"
require "../models/user"

get "/v1/devices" do |env|
  user_id = env.params.query["user_id"].as(String)
  puts user_id
  devices = Device.where user_id: user_id

  devices.map { |param| param }.to_json
end

post "/v1/devices" do |env|
  user_id = env.params.json["user_id"].as(String)
  name = env.params.json["name"].as(String)
  mac_id = env.params.json["mac_id"].as(String)

  user = User.find user_id

  if !user
    env.response.status = HTTP::Status::UNAUTHORIZED
    next {
      "status": "error",
      "data": "not authenticated"
    }
  end
  
  device = Device.create!(
    user_id: user_id, 
    name: name, 
    mac_id: mac_id
  )

  device.to_json
end

delete "/v1/devices/:device_id" do |env|
  device_id = env.params.url["device_id"].as(String).to_i64
  device = Device.find device_id
  if !device
    env.response.status = HTTP::Status::NOT_FOUND
    next {
      "status": "error",
      "data": "not found",
    }.to_json
  end

  device.destroy

  if device.destroyed?
    env.response.status = HTTP::Status::NO_CONTENT
    {
      "status": "success",
    }.to_json
  else
    env.response.status = HTTP::Status::BAD_REQUEST
    {
      "status": "error",
      "data": "Could Not Destroy"
    }.to_json
  end 
end

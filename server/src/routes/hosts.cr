require "../models/host"
require "../models/user"

get "/v1/hosts" do |env|
  user_id = env.params.query["user_id"].as(String)
  puts user_id
  hosts = Host.where user_id: user_id

  hosts.map { |param| param }.to_json
end

post "/v1/hosts" do |env|
  user_id = env.params.json["user_id"].as(String)
  name = env.params.json["name"].as(String)

  user = User.find user_id

  if !user
    env.response.status = HTTP::Status::UNAUTHORIZED
    next {
      "status": "error",
      "data": "not authenticated"
    }
  end

  token = Random::Secure.hex(32)
  
  host = Host.create!(
    user_id: user_id, 
    name: name, 
    token: token
  )

  host.to_json
end

delete "/v1/hosts/:host_id" do |env|
  host_id = env.params.url["host_id"].as(String).to_i64
  host = Host.find host_id
  if !host
    env.response.status = HTTP::Status::NOT_FOUND
    next {
      "status": "error",
      "data": "not found",
    }.to_json
  end

  host.destroy

  if host.destroyed?
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

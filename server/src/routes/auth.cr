# require "json"

# NO_GET_MESSAGE = "Auth API's are only available via POST or DELETE to log out!"

# get "/v1/auth" do
#   {"status": "error", "data": NO_GET_MESSAGE}.to_json
# end

# post "/v1/auth" do |env|
#   username = env.params.json['username']
#   password = env.params.
# end
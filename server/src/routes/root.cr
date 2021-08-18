require "kemal"

get "/" do
  {
    "status": "success",
    "data": "Hi!"
  }.to_json
end

require "./config"

require "kemal"
require "./routes"

require "./middleware/json"

default_to_json_response()

Kemal.run

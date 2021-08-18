require "./user"
require "./device"
require "./host"

require "granite"

class Connected < Granite::Base
  table connecteds

  column id : Int64, primary: true
  column device_id : Int64
  column host_id : Int64
  column user_id : String

  belongs_to :user, foreign_key: user_id : String, primary_key: :username
  belongs_to :device
  belongs_to :host
  
end

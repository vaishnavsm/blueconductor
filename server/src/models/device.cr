require "./user"
require "./connected"

require "granite"

class Device < Granite::Base
  table devices

  column id : Int64, primary: true 
  column name : String
  column mac_id : String
  column user_id : String

  belongs_to :user, foreign_key: user_id : String, primary_key: :username

  has_one :connected
end

require "./host"
require "./connected"

require "granite"

class User < Granite::Base
  table users

  column name : String
  column username : String, primary: true, auto: false
  column token : String

  def id()
    return @username
  end

  timestamps

  has_many devices : Device
  has_many hosts : Host
  has_many connecteds : Connected
end
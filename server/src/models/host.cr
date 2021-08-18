require "./user"
require "./connected"

require "granite"

class Host < Granite::Base
  table hosts

  column id : Int64, primary: true
  column name : String
  column token : String
  column user_id : String

  belongs_to :user, foreign_key: user_id : String, primary_key: :username

  has_many connecteds : Connected

end

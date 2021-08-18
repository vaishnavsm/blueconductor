require "../models/user"

user = User.find "admin"
if user == nil
  user = User.create!(
    name: "Admin",
    username: "admin",
    token: Random::Secure.hex(32)
  )

  puts "======="
  puts "Admin User"
  puts "======="
  puts "Username: admin"
  puts "Token: #{user.token}"
  puts "======="

else
  puts "Admin user exists.\nUsing existing credentials."
end

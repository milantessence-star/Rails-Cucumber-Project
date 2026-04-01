Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end

# Before('@admin') do
#   @user = User.create!(email: 'admin@test.com', password: 'password', role: 'admin')
# end
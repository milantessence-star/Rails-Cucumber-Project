Given("the database is seeded") do
  User.create!(email: 'user@test.com',  password: 'password', role: 'user')
  User.create!(email: 'admin@test.com', password: 'password', role: 'admin')
end

Given("I am on the login page") do
  sleep 3
  visit login_path
end

When("I fill in {string} with {string}") do |field, value|
  sleep 3
  fill_in field, with: value
end

When("I click {string}") do |button|
  sleep 3
  click_button button
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Given("I login as {string}") do |role|
  user = User.find_by(role: role)
  sleep 3
  visit login_path
  sleep 3
  fill_in 'Email',    with: user.email
  fill_in 'Password', with: 'password'
  sleep 3
  click_button 'Log in'
end

Then("I see {string}") do |page_text|
  expect(page).to have_content(page_text)
end

Given("the following users exist:") do |table|
  table.hashes.each do |row|
    User.find_or_create_by!(email: row['email']) do |u|
      u.password = row['password']
      u.role     = row['role']
    end
  end
end
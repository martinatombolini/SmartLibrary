Given ("I am a registered reader") do
    @user = User.create!({:username => "simonalai", :email => "simona.lai@gmail.com", :password => "10101010", :password_confirmation => "10101010", :roles_mask => 0})
end  

When('I am on the login page') do
    visit new_user_session_path
end

When('I fill in {string} with {string}') do |string, string2|
    fill_in(string, :with => string2)
end

When('I press {string}') do |string|
    click_button(string)
end

Then('I should be on the profile page') do
    current_path= URI.parse(current_url).path
    current_path=="/users/:id"
end

Then('I should see {string}') do |string|
    page.has_text?(string)
end

When('I am on the sign up page') do
    visit new_user_registration_path
end
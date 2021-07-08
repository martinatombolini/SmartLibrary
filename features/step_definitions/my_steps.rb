Given ("I am a registered user") do
    @user = User.create!({:username => "simonalai", :email => "simona.lai@gmail.com", :password => "10101010", :password_confirmation => "10101010", :roles_mask => 0})
end  

Given ("I am a Reader") do
    @user = User.create!({:username => "simonalai", :email => "simona.lai@gmail.com", :password => "10101010", :password_confirmation => "10101010", :roles_mask => 0})
    visit new_user_session_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_button('Log in')
end  

Given ("I am a Library") do
    @user = User.create!({:username => "simonalai", :email => "simona.lai@gmail.com", :password => "10101010", :password_confirmation => "10101010", :roles_mask => 1})
    visit new_user_session_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_button('Log in')
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

When('I visit the profile page') do
    visit user_path(@user.id)
end
  
Then('I should be on the book details page') do
    current_path= URI.parse(current_url).path
    current_path=="/books/:id"
end

When('I visit the homepage') do
    visit root_path
end

Given('There is at least one book') do
    @book=Book.create(:title => "Title", :author => "Author", :notes => "Notes", :isbn => "1234567890123", :owner=>@user.id)
end
  
Given('I am the owner of the book') do
    expect(@user.id).to be == @book.owner
end
  
Then('I should be on the post edit page') do
    current_path= URI.parse(current_url).path
    current_path=="/books/:id/edit"
end

Given('I am on the book index page') do
    visit books_path
end

When('I click {string}') do |string|
    click_link(string)
end

Given('I should not see {string}') do |string|
    page.has_no_text?(string)
end

  
Then('I should be on the search page') do
    current_path= URI.parse(current_url).path
    current_path=="search"
end
require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "a user can be created" do
    visit new_user_path
    fill_in "Username", with: "Parker"
    fill_in "Password", with: "Password"
    fill_in "Email address", with: "Sample@gmail.com"
    fill_in "Phone number", with: "000-000-0000"
    click_button "Create Account"

    assert page.has_content?("Parker's Homepage")
  end
end

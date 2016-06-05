require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "a user can be created" do
    visit new_user_path
    fill_in "Username", with: "Parker"
    fill_in "Password", with: "Password"
    fill_in "Email address", with: "Sample@gmail.com"
    fill_in "Phone number", with: "000-000-0000"
    click_button "Create User"

    assert page.has_content?("Welcome Parker")
  end

  test "guest entered invalid information, new page rendered" do
    visit new_user_path
    assert page.has_content?("Create Account")
    fill_in "Username", with: ""
    fill_in "Password", with: "Password"
    fill_in "Email address", with: "Sample@gmail.com"
    fill_in "Phone number", with: "000-000-0000"
    click_button "Create User"

    assert page.has_content?("Create Account")
  end
end

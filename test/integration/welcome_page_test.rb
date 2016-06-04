require 'test_helper'

class WelcomePageTest < ActionDispatch::IntegrationTest

  test "users see the homepage when visiting the root" do
    visit root_path

    assert page.has_content?("Captain Jobs")
    assert page.has_content?("Login")
    assert page.has_content?("Create Account")
  end

end

require 'test_helper'

class GuestSeesErrorWhenTryinToAccessUserPageTest < ActionDispatch::IntegrationTest

  test "guest cannot access user pages" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")

    visit user_path(user)
    assert page.has_content?("Error 403")
  end

end

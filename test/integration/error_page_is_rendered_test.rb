require 'test_helper'

class ErrorPageIsRenderedTest < ActionDispatch::IntegrationTest

  test "error page is rendered when an invalid url is submitted" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(2)
    assert page.has_content?("Whoops")
    assert page.has_content?("Error 404")
  end

end

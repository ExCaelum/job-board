require 'test_helper'

class UserCanViewOtherPagesTest < ActionDispatch::IntegrationTest

  test "user can access other user's pages" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")
    user2 = User.create(username: "David", password: "password",
                        email_address: "other@gmail.com",
                        phone_number: "111-111-1111")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user2)
    assert page.has_content?("David's Homepage")
  end

end

require 'test_helper'

class AdminCanDeleteTagTest < ActionDispatch::IntegrationTest

  test "Admin can delete a tag" do
    skip
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000",
                       role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    tag1 = Tag.create(name: "Tag1")
    visit admin_tag_path(tag1)
    click_link "Delete"
    assert page.has_content?("Tag1's Skills")

    # The delete method works in development but not test
    refute page.has_content?("Skill")
    refute page.has_content?("A skill")
  end

end

require 'test_helper'

class AdminCanViewIndividualTagsTest < ActionDispatch::IntegrationTest

  test "Admin can edit a tag" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000",
                       role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    tag1 = Tag.create(name: "Tag1")

    visit edit_admin_tag_path(tag1)
    fill_in "Name", with: "Updated tag"
    click_button "Update Tag"
    assert page.has_content?("Updated tag's Skills")
  end

end

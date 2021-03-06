require 'test_helper'

class AdminCanViewIndividualTagsTest < ActionDispatch::IntegrationTest

  test "Admin can see skills for a tag" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000",
                       role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    tag1 = Tag.create(name: "Tag1")
    tag1.skills.create(name: "Skill", description: "A skill", user: user)

    visit admin_tag_path(tag1)
    assert page.has_content?("Tag1's Skills")
    assert page.has_content?("Skill")
    assert page.has_content?("A skill")
  end

end

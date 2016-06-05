require 'test_helper'

class UserCanEditTheirSkillTest < ActionDispatch::IntegrationTest

  test "User can edit their own skill" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    skill = user.skills.create(name: "New Skill", description: "This is a new Skill")

    visit edit_user_skill_path(user, skill)
    assert page.has_content?("Edit Skill")
    fill_in "Name", with: "Updated Skill"
    fill_in "Description", with: "This is an updated skill"
    click_button "Update"
    assert page.has_content?("Parker")
    assert page.has_content?("Updated Skill")
    assert page.has_content?("This is an updated skill")
  end

end

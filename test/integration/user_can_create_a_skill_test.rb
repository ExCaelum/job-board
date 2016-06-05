require 'test_helper'

class UserCanCreateASkillTest < ActionDispatch::IntegrationTest

  test "User can create a Skill" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit new_user_skill_path(user)
    assert page.has_content?("Create a Skill")
    fill_in "Name", with: "NewSkill"
    fill_in "Description", with: "This is a new Skill"
    fill_in "Tag list", with: "New, Skill"
    click_button "Create"

    assert page.has_content?("NewSkill")
    assert page.has_content?("This is a new Skill")
    assert page.has_content?("New")
    assert page.has_content?("Skill")
  end

end

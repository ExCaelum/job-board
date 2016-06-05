require 'test_helper'

class AdminCanEditASkillTest < ActionDispatch::IntegrationTest

  test "Admin can edit others skill" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000",
                       role: 1)
    user2 = User.create(username: "David", password: "password",
                       email_address: "other@gmail.com",
                       phone_number: "111-111-1111")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    skill = user2.skills.create(name: "New Skill", description: "This is a new Skill")

    visit edit_admin_skill_path(skill)
    assert page.has_content?("Edit Skill")
    fill_in "Name", with: "Updated Skill"
    fill_in "Description", with: "This is an updated skill"
    click_button "Update Skill"
    assert page.has_content?("David")
    assert page.has_content?("Updated Skill")
    assert page.has_content?("This is an updated skill")
  end

  test "Admin input invalid information, render edit" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000",
                       role: 1)
    user2 = User.create(username: "David", password: "password",
                       email_address: "other@gmail.com",
                       phone_number: "111-111-1111")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    skill = user2.skills.create(name: "New Skill", description: "This is a new Skill")

    visit edit_admin_skill_path(skill)
    assert page.has_content?("Edit Skill")
    fill_in "Name", with: ""
    fill_in "Description", with: "This is an updated skill"
    click_button "Update Skill"
    assert page.has_content?("Edit Skill")
  end

end

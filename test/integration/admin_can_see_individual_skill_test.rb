require 'test_helper'

class AdminCanSeeIndividualSkillsTest < ActionDispatch::IntegrationTest

  test "Admin can see single skill" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000",
                       role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    skill = user.skills.create(name: "New Skill", description: "This is a new Skill")

    visit admin_skill_path(skill)

    assert page.has_content?("New Skill")
    assert page.has_content?("This is a new Skill")
  end

end

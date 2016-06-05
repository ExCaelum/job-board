require 'test_helper'

class UserCanSeeTheirSkillsTest < ActionDispatch::IntegrationTest

  test "User can see their own skills" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    user.skills.create(name: "New Skill", description: "This is a new Skill")

    visit user_skills_path(user)

    assert page.has_content?("Your Skills")
    assert page.has_content?("New Skill")
  end

end

require 'test_helper'

class UserCanSeeAllSkillsTest < ActionDispatch::IntegrationTest

  test "User can see all skills" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")
    # user2 = User.create(username: "David", password: "password",
    #                    email_address: "other@gmail.com",
    #                    phone_number: "111-111-1111")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    user.skills.create(name: "My Skill", description: "This is my skill")
    user.skills.create(name: "New Skill", description: "This is a new Skill")

    visit all_skills_path
    assert page.has_content?("All Skills")
    assert page.has_content?("My Skill")
    assert page.has_content?("This is my skill")
    assert page.has_content?("New Skill")
    assert page.has_content?("This is a new Skill")
  end
end

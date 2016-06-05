require 'test_helper'

class UserCanViewOtherUsersSkillsTest < ActionDispatch::IntegrationTest

  test "User can see other users skills" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")
    user2 = User.create(username: "David", password: "password",
                        email_address: "other@gmail.com",
                        phone_number: "111-111-1111")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    user2.skills.create(name: "New Skill", description: "This is a new Skill")
    visit user_skills_path(user2)

    assert page.has_content?("David's Skills")
    assert page.has_content?("New Skill")
    assert page.has_content?("This is a new Skill")
  end

end

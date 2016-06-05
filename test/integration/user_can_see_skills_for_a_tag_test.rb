require 'test_helper'

class UserCanSeeSkillsForATagTest < ActionDispatch::IntegrationTest

  test "User can see skills for a tag" do
    user = User.create(username: "Parker", password: "password",
                       email_address: "sample@gmail.com",
                       phone_number: "000-000-0000")
    tag1 = Tag.create(name: "Tag1")
    tag1.skills.create(name: "Skill", description: "A skill", user: user)

    visit tag_path(tag1)
    assert page.has_content?("Tag1's Skills")
    assert page.has_content?("Skill")
    assert page.has_content?("A skill")
  end

end

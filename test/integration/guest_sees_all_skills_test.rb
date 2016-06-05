require 'test_helper'

class GuestSeesAllSkillsTest < ActionDispatch::IntegrationTest

  test "guest sees skills" do

    Skill.create(name: "My Skill", description: "This is my skill")

    visit root_path
    click_link "All Skills"

    assert page.has_content?("All Skills")
    assert page.has_content?("My Skill")
  end

end

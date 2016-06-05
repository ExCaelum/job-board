require 'test_helper'

class UserCanViewAllTagsTest < ActionDispatch::IntegrationTest

  test "User can view all tags" do
    tag1 = Tag.create(name: "Tag1")
    tag2 = Tag.create(name: "Tag2")
    tag1.skills.create(name: "Skill", description: "A skill")
    tag2.skills.create(name: "Another", description: "here")

    visit tags_path
    assert page.has_content?("All Tags")
    assert page.has_content?("Tag1")
    assert page.has_content?("Tag2")
  end

end

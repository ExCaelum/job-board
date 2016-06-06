require 'test_helper'

# Test for the Skill model
class SkillTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:description)

  should belong_to(:user)
end

require 'test_helper'

# Test for the Skill Tag join table
class SkillsTagTest < ActiveSupport::TestCase
  should belong_to(:skill)
  should belong_to(:tag)
end

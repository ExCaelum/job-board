require 'test_helper'

class SkillsTagTest < ActiveSupport::TestCase
  should belong_to(:skill)
  should belong_to(:tag)
end

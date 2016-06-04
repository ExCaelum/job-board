require 'test_helper'

class SkillTest < ActiveSupport::TestCase

  should validate_presence_of(:name)
  should validate_presence_of(:description)

  should belong_to(:user)
end

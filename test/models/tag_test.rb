require 'test_helper'

# Test for the Tag model
class TagTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)

  should have_many(:skills_tags)
  should have_many(:skills)
end

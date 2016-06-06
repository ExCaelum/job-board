# Join table for skills and tags
class SkillsTag < ActiveRecord::Base
  belongs_to :skill
  belongs_to :tag
end

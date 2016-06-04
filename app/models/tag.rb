class Tag < ActiveRecord::Base
  has_many :skills_tags
  has_many :skills, through: :skills_tags

  validates :name, presence:   true,
                   uniqueness: true
end

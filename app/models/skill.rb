class Skill < ActiveRecord::Base
  belongs_to :user
  has_many :skills_tags
  has_many :tags, through: :skills_tags

  validates :name,        presence: true
  validates :description, presence: true
end

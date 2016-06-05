class Skill < ActiveRecord::Base
  belongs_to :user
  has_many :skills_tags, dependent: :destroy
  has_many :tags, through: :skills_tags

  validates :name,        presence: true
  validates :description, presence: true

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase.capitalize}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end

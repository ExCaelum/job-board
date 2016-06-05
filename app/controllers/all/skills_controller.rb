class All::SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

end

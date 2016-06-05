class Guest::SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

end

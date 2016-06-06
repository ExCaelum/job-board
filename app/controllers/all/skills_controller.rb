# Skills controller for the all namespace, skill index for all users
class All::SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end
end

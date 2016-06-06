# Skills controller for the all namespace, skill index for all users
class All::SkillsController < ApplicationController
# love this restful controller! Good stuff my dude!
  def index
    @skills = Skill.all
  end
end

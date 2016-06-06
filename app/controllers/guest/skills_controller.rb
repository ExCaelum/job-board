# Skills controller for the guests namespace, skill index for guests
class Guest::SkillsController < ApplicationController
  skip_before_action :require_log_in

  def index
    @skills = Skill.all
  end
end

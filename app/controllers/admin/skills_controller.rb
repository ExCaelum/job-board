class Admin::SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to admin_skill_path(@skill)
    else
      render :edit
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :description, :tag_list)
  end

end
class SkillsController < ApplicationController

  def new
    @skill = current_user.skills.new
  end

  def create
    @skill = Skill.create(skill_params)
    @skill.user = current_user
    if @skill.save
      redirect_to user_skill_path(current_user, @skill)
    else
      render :new
    end
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def index
    @skills = Skill.all
    @user = User.find(params[:user_id])
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :description, :tag_list)
  end

end

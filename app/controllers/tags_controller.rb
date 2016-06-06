# This is the tags controller, controls showing tags
class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @skills = @tag.skills
  end
end

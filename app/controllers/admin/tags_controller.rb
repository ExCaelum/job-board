# Tags controller for the admin namespace, admin crud for tags
class Admin::TagsController < Admin::BaseController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @skills = @tag.skills
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admin_tag_path(@tag)
    else
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end

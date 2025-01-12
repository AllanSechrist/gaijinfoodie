class BlogsController < ApplicationController
  def index
    @blogs = Blog.order(created_at: :desc).limit(3)
  end

  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params_new)
    @blog.published_date = Date.today
    @blog.save
    redirect_to blog_path(@blog)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params_new)
    redirect_to blog_path(@blog)
  end

  def like
    @blog = Blog.find(params[:id])
    @blog.like!
    respond_to do |format|
      format.html { redirect_to blog_path(@blog) }
      format.json { render json: { likes: @blog.likes } }
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def blog_params_new
    params.require(:blog).permit(:title, :content, :food_rating, :service_rating, :price_rating, :restaurant_id)
  end
end

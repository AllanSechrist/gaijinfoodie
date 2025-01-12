class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @blog = Blog.find(params[:blog_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.published_date = Date.today
    @blog = Blog.find(params[:blog_id])
    @comment.blog = @blog
    if @comment.save
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :blog_id)
  end
end

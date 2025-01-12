class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @blog = Blog.find(params[:blog_id])
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params) # build associates comment with blog
    @comment.user = current_user
    @comment.published_date = Date.today

    if @comment.save
      redirect_to blog_path(@blog)
    else
      render 'blogs/show', status: :unprocessable_entity
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
    params.require(:comment).permit(:content)
  end
end

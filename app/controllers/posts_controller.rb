class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path, notice: "Post created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to root_path, notice:"Post are deleted successfully"
    else
      redirect_to root_path, notice:"Post can't be deleted"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end

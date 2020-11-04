class PostsController < ApplicationController
before_action :authenticate_user!
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_new = Post.new
    @like = Like.new
    # @post_comment = PostComment.new
    # @post_comments = @post.post_comments
  end

  def index
    @posts = Post.all
    @user = current_user
    @post = Post.new
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    tag_list = params[:tag_list].split(",")
    if @post.save
       @post.save_tags(tag_list)
      redirect_to post_path(@post), notice: "You have created book successfully."
    else
      @posts = Post.all
      @user = current_user
      render 'index'
    end
  end

  def edit
    @post = Post.find(params[:id])
    # @tag_list = @post.tags.pluck(:name).join(",")
    if current_user != @post.user
      redirect_to posts_path
    end
  end



  def update
    @post = Post.find(params[:id])
    tag_list = params[:tag_list].split(",")
    if @post.update(post_params)
      @post.save_tags(tag_list)
      redirect_to post_path(@post), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :image_id, :tag_id)
  end

end

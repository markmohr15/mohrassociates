class Admin::PostsController < ApplicationController
  before_action :authenticate_admin, :in_admin

  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 25).order("created_at desc")
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to admin_posts_path, notice: "Post has been created."
    else
      @posts = Post.all.order("created_at desc")
      render :index
    end
  end

  def edit
    @post = Post.find_by_slug params[:id]
  end

  def update
    @post = Post.find_by_slug params[:id]
    if @post.update post_params
      redirect_to admin_posts_path, notice: "Post has been updated."
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by_slug params[:id]
    if @post.destroy
      redirect_to admin_posts_path, notice: "Post has been deleted."
    else
      render :index
    end
  end

private

  def post_params
    params.require(:post).permit(:title, :author, :content, :published)
  end

  def in_admin
    @in_admin = true
  end

end

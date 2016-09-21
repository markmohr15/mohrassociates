class PostsController < ApplicationController

  def index
    @posts = Post.where(published: true).paginate(page: params[:page], per_page: 5).order("updated_at desc")
  end

  def show
    @post = Post.find_by_slug params[:id]
  end

end

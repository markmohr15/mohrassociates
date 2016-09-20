class Admin::NewsController < ApplicationController
  before_action :authenticate_admin

  def index
    @news = News.all
    @new_news = News.new
  end

  def create
    @new_news = News.new news_params
    if @new_news.save
      redirect_to news_path, notice: "News Item has been created."
    else
      render :new
    end
  end

  def edit
    render
  end

  def update
    if @news_item.update news_params
      redirect_to news_path, notice: "News Item has been updated."
    else
      render :edit
    end
  end

  def destroy
    if @news_item.destroy
      redirect_to news_path, notice: "News Item has been deleted."
    else
      render :index
    end
  end

private

  def news_params
    params.require(:news).permit(:subject, :author, :post)
  end

end

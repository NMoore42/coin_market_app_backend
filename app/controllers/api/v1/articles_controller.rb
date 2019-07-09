class Api::V1::ArticlesController < ApplicationController


  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :accepted
    else
      render json: { errors: @article.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def index
    @articles = Article.all
    render json: @articles
  end

  def remove
    @article = User.get_article(params[:user_id], params[:url])
    @article.destroy
    render json: @article
  end


  private

  def article_params
    params.require(:article).permit(:user_id, :title, :url, :coin)
  end


end

class ArticlesController < ApplicationController
  # index
  def index
    @articles = Article.all
  end

  # new
  def new
    @article = Article.new
  end

  # create
  def create
    @article = Article.create!(article_params)

    redirect_to article_path(@article)
  end

  #show
  def show
    @article = Article.find(params[:id])
  end

  # edit
  def edit
    @article = Article.find(params[:id])
  end


  # update
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  # destroy
  def destroy
    @article = Article.find(params[:id]).destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :photo_url, :author_name)
  end
end

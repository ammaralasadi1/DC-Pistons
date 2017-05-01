class ArticlesController < ApplicationController
  # index
  def index
    @articles = Article.all
  end

  # new
  def new
    @article = current_user.articles.create
    @categories = Category.all.map {|c| [c.name, c.id]}

  end

  # create
  def create
    @article = current_user.articles.create(article_params)
    @article.category_id = params[:category_id]
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
    if @article.user == current_user
      @article.update(article_params)
    else
      flash[:alert] = "Only the author of the article can Update"
    end


    redirect_to article_path(@article)
  end

  # destroy
  def destroy
    @article = Article.find(params[:id])
    if @article.user == current_user
      @article.destroy
    else
      flash[:alert] = "Only the author of the article can delete"
    end
    redirect_to articles_path
  end


  private
  def article_params
    params.require(:article).permit(:title, :body, :photo_url, :author_name, :category_id)
  end
end

class ArticlesController < ApplicationController

#welcome

def welcome
@articles = Article.all
@cars = Car.all
end

  # index
  def index
    if params[:category].blank?
    @articles = Article.all
  else
    category_id = Category.find_by(name: params[:category]).id
    @articles = Article.where(:category_id => category_id).order("created_at DESC")
  end
  end

  # new
  def new
    @article = current_user.articles.create
    @categories = Category.all.map {|c| [c.name, c.id]}

  end

  # create
  def create
  		@article = current_user.articles.build(article_params)
  		@article.category_id = (params[:category_id])

  		if @article.save
  			redirect_to root_path
  		else
  			render 'new'
  		end
  	end

  #show
  def show
    @article = Article.find(params[:id])
  end

  # edit
  def edit
    @categories = Category.all.map {|c| [c.name, c.id]}
    @article = Article.find(params[:id])
  end

# update
  def update
    @article = Article.find(params[:id])
    @article.category_id = (params[:category_id])

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

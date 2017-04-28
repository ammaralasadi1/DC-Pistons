class CommentsController < ApplicationController

  # new
  def index
    @comments = Comment.all
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new
  end

  # create
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create!(comment_params)

    redirect_to article_path(@article)
  end

  #show
  def show
    @comment = Comment.find(params[:id])
  end

  # edit
  def edit
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  # update
  def update
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    redirect_to article_comment_path(@article, @comment)
  end

  # destroy
  def destroy
    @comment = Comment.find(params[:id]).destroy

    redirect_to article_path(@comment.article)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :author_name)
  end
end

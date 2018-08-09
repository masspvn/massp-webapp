class ArticlesController < ApplicationController
  #  lists all the posts
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # create a new post
  def new
    @article = Article.new
  end

  # edit view
  def edit
    @article = Article.find(params[:id])
  end

  # create a post
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # update the post content
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end

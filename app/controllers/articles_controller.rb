class ArticlesController < ApplicationController
   def index
      @artilces = Article.all
   end

   def show
      @article = Article.find(params[:id])
   end

   def new
      @article = Article.new
   end

   def create
      @article = Article.new(params.require(:article).permit(:title, :description))
      @article.save
      redirect_to @article
   end
end

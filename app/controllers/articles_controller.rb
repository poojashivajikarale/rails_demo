class ArticlesController < ApplicationController
   def index
      @artilces = Article.all
   end

   def show
      @article = Article.find(params[:id])
   end
end

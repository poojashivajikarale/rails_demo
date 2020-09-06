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

   def edit
      @article = Article.find(params[:id])
   end

   def create
      @article = Article.new(params.require(:article).permit(:title, :description))
      if @article.save
         flash[:note] = "The article created successfully"
         redirect_to @article
      else
        render 'new'
      end
   end

   def update
      @article = Article.find(params[:id])
      if @article.update(params.require(:article).permit(:title, :description))
         flash[:note] = "The article updated successfully"
         redirect_to @article
      else
        render 'edit'
      end
   end

   def destroy
      @article = Article.find(params[:id])
      if @article.destroy 
         flash[:note] = "The article deleted successfully"
      else
         flash[:note] = "The article is not deleted"
      end
      redirect_to articles_path(@article)
   end
end

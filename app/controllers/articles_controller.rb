class ArticlesController < ApplicationController
   before_action :find_article, only: [:show, :edit, :update, :destroy]

   def index
      @articles = Article.paginate(page: params[:page], per_page: 5)
      p "hello pooja"
      p "hello world"

   end

   def show
   end

   def new
      @article = Article.new
   end

   def edit
   end

   def create
      @article = Article.new(permit_params)
      @article.user = User.first
      if @article.save
         flash[:note] = "The article created successfully"
         redirect_to @article
      else
        render 'new'
      end
   end

   def update
      if @article.update(permit_params)
         flash[:note] = "The article updated successfully"
         redirect_to @article
      else
        render 'edit'
      end
   end

   def destroy
      if @article.destroy 
         flash[:note] = "The article deleted successfully"
      else
         flash[:note] = "The article is not deleted"
      end
      redirect_to articles_path(@article)
   end

   private
     def find_article
        @article = Article.find(params[:id])
     end
     
     def permit_params
       params.require(:article).permit(:title, :description)
     end
end

Rails.application.routes.draw do
   root 'pages#home'
   #get 'pages/about'
   get 'about', to: 'pages#about'
   resources 'articles', only: [:show, :index]
end

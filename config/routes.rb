Rails.application.routes.draw do
   root 'pages#home'
   #get 'pages/about'
   get 'about', to: 'pages#about' 
end

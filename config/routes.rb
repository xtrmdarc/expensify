Rails.application.routes.draw do
  post '/users/login', to: 'users#login'
  get '/measurement/index'
  get '/expense_category/index'
  post '/users', to: 'users#create'
  post '/measurement/create', to: 'measurements#create'
  get '/category/:id', to: 'expense_category#category'
  get '/progress/:user_id', to: 'measurements#progress'
  get '/users/auto_login', to: 'users#auto_login'
  post '/progress/month', to: 'measurements#progress_detail'
end

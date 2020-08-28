Rails.application.routes.draw do
  post '/users/login', to: 'users#login'
  get '/measurement/index'
  get '/expense_category/index'
  # post '/users'
  post '/measurement/create', to: 'measurements#create'
  get '/category/:id', to: 'expense_category#get_category'
  get '/progress/:user_id', to: 'measurements#get_progress'

end

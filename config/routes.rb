Rails.application.routes.draw do
  post 'users/login'
  get 'measurement/index'
  get 'expense_category/index'
  post 'measurement/create', to: 'measurements#create'
  get 'category/:id', to: 'expense_category#get_category'

end

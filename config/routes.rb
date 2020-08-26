Rails.application.routes.draw do
  get 'measurement/index'
  get 'expense_category/index'
  post 'measurement/create', to: 'measurements#create'
  
end

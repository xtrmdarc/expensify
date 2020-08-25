class ExpenseCategoryController < ApplicationController
  def index
    categories = ExpenseCategory.all
    render json: categories, status: :ok
  end
end

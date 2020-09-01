class ExpenseCategoryController < ApplicationController
  before_action :authorized

  def index
    categories = ExpenseCategory.all
    render json: categories, status: :ok
  end

  def category
    cat = ExpenseCategory.find(params[:id])
    render json: cat, status: :ok
  end
end

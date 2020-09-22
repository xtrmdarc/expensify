class ExpenseCategoryController < ApplicationController
  before_action :authorized

  def index
    categories = ExpenseCategory.all
    render json: categories, status: :ok
  end

  def category
    cat = ExpenseCategory.find(expense_category_params[:id])
    render json: cat, status: :ok
  end

  private

  def expense_category_params
    params.permit(:id)
  end
end

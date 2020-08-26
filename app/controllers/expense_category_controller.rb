class ExpenseCategoryController < ApplicationController
  def index
    categories = ExpenseCategory.all
    render json: categories, status: :ok
  end

  def get_category
    cat = ExpenseCategory.where(id: params[:id]).first
    render json: cat, status: :ok
  end
end

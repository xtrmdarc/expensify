class MeasurementsController < ApplicationController
  def index
  end

  def create
    # Implement with params
    new_measurement = Measurement.new(expense_category_id: params[:ex_cat_id],
      date: params[:date],
      user_id: params[:user_id],
      value: params[:value]
      )

    if new_measurement.save
      render json: { code: 1}
    else
      render json: { code: 0}
    end
  end

  def get_progress
    measurements = Measurement.includes(:expense_category).where(user_id: params[:user_id])
    render json: measurements.to_json(include:  [:expense_category]), status: :ok
  end
end

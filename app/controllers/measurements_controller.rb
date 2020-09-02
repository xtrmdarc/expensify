class MeasurementsController < ApplicationController
  before_action :authorized

  def index; end

  def create
    # Implement with params
    new_measurement = Measurement.new(expense_category_id: params[:ex_cat_id],
                                      date: params[:date],
                                      user_id: params[:user_id],
                                      value: params[:value])

    if new_measurement.save
      render json: { code: 1 }
    else
      render json: { code: 0 }
    end
  end

  def progress
    measurements = Measurement.progress(params[:user_id])
    render json: measurements.to_json(include: [:expense_category]), status: :ok
  end

  def progress_detail
    measurements = Measurement.progress_detail(params[:user_id], params[:month])
    render json: measurements.to_json(include: [:expense_category]), status: :ok
  end
end

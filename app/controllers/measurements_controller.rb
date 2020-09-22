class MeasurementsController < ApplicationController
  before_action :authorized

  def index; end

  def create
    new_measurement = Measurement.new(measurement_params)

    if new_measurement.save
      render json: { code: 1 }
    else
      puts new_measurement.errors.full_messages
      render json: { code: 0 }
    end
  end

  def progress
    measurements = Measurement.progress(measurement_params[:user_id])
    render json: measurements.to_json(include: [:expense_category]), status: :ok
  end

  def progress_detail
    measurements = Measurement.progress_detail(measurement_params[:user_id], measurement_params[:month])
    render json: measurements.to_json(include: [:expense_category]), status: :ok
  end

  private

  def measurement_params
    params.permit(:expense_category_id, :date, :user_id, :value, :month)
  end
end

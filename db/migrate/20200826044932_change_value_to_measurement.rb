class ChangeValueToMeasurement < ActiveRecord::Migration[6.0]
  def change
    change_column :measurements, :value, :float
  end
end

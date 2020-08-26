class AddUserIdToMeasurement < ActiveRecord::Migration[6.0]
  def change
    add_column :measurements, :user_id, :integer, default: nil
  end
end

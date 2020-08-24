class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.decimal :value
      t.integer :expense_category_id
      t.datetime :date

      t.timestamps
    end
  end
end

class Measurement < ApplicationRecord
  belongs_to :expense_category
  belongs_to :user

  def self.progress(user_id)
    includes(:expense_category).where(user_id: user_id)
  end

  def self.progress_detail(user_id, month)
    includes(:expense_category).where(user_id: user_id).where("cast(strftime('%m', date) as int) = ?", month)
  end
end

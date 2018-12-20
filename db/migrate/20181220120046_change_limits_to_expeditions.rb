class ChangeLimitsToExpeditions < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:expeditions, :title, false)
    change_column_null(:expeditions, :description, false)
  end
end

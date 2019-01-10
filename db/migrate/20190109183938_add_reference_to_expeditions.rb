class AddReferenceToExpeditions < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.belongs_to :expedition, optional: true
    end
  end
end

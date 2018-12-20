class AddLimitsToExpeditions < ActiveRecord::Migration[5.2]
  def up
    change_table :expeditions do |t|
      t.change :title, :string
      t.change :description, :text
    end
  end

  def down
    change_table :expeditions do |t|
      t.change :title, :string, null: false
      t.change :description, :text, null: false
    end
  end
end

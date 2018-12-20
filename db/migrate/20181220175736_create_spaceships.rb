class CreateSpaceships < ActiveRecord::Migration[5.2]
  def change
    create_table :spaceships do |t|
      t.string :title
      t.float :velocity
      t.belongs_to :expedition, foreign_key: true

      t.timestamps
    end
  end
end

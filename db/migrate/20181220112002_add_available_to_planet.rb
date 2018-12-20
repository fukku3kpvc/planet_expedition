class AddAvailableToPlanet < ActiveRecord::Migration[5.2]
  def change
    add_column :planets, :available, :boolean
  end
end

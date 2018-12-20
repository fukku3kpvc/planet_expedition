class AddLimitsToPlanet < ActiveRecord::Migration[5.2]
  def change
    change_column :planets, :title, :string, :null => false
    change_column :planets, :galaxy, :string, :null => false
    change_column :planets, :description, :text, :null => false
    change_column :planets, :distance, :float, :null => false
    change_column :planets, :available, :boolean, :default => true, :null => false
  end
end

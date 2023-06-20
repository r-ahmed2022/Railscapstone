class AddColumnToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :preparation_time, :integer
    add_column :recipes, :cooking_time, :integer
    add_column :recipes, :public, :boolean
  end
end



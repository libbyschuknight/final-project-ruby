class CreateMealIngredients < ActiveRecord::Migration
  def change
    create_table :meal_ingredients do |t|
      t.references :ingredient, index: true, foreign_key: true
      t.references :meal, index: true, foreign_key: true
      t.float :quantity
      t.string :measurement

      t.timestamps null: false
    end
  end
end

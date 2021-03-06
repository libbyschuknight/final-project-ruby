class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.belongs_to :mealPlan, index: true
      t.string :name
      t.string :imageURL
      t.text :cooking_instructions
      t.integer :likes
      t.integer :dislikes

      t.timestamps null: false
    end
  end
end

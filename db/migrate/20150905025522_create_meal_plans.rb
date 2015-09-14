class CreateMealPlans < ActiveRecord::Migration
  def change
    create_table :meal_plans do |t|
      t.string :dayOfWeek
      t.boolean :eaten

      t.timestamps null: false
    end
  end
end

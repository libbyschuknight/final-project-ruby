class UpdateMeals < ActiveRecord::Migration
  def change
    rename_column :meals, :mealPlan_id, :meal_plan_id
  end
end

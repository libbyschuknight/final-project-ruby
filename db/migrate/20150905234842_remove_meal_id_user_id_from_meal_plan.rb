class RemoveMealIdUserIdFromMealPlan < ActiveRecord::Migration
  def change
    remove_column :meal_plans, :meal_id, :integer
    remove_column :meal_plans, :user_id, :integer
  end
end

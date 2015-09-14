class AddDetailsToMealPlan < ActiveRecord::Migration
  def change
    add_column :meal_plans, :meal_id, :integer
    add_column :meal_plans, :user_id, :integer
  end
end

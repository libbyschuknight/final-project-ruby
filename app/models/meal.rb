class Meal < ActiveRecord::Base
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
  belongs_to :mealPlan


  def ingredient_details
    @meal.ingredients
    @meal.meal_ingredients
  end

end

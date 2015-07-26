class Meal < ActiveRecord::Base
  has_many :mealsIngredients
  has_many :ingredients, through: :mealsIngredients
  belongs_to :mealPlan
end

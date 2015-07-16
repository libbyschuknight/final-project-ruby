class Ingredient < ActiveRecord::Base
  has_many :mealsIngredients
  has_many :meals, through: :mealsIngredients
end

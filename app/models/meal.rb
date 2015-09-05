class Meal < ActiveRecord::Base

  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
  belongs_to :meal_plan

  def ingredient_details
    details = meal_ingredients.includes(:ingredient)
    details.each_with_object([]) do |detail, result|
      result << IngredientDetail.from_a_meal_ingredient(detail)
    end
  end

end

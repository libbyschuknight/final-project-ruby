class Meal < ActiveRecord::Base

  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
  belongs_to :mealPlan

  def ingredient_details
    details = meal_ingredients.includes(:ingredient)
    details.each_with_object([]) do |detail, result|
      result << detail_object(detail)
    end
  end

private

  def detail_object(detail)
    IngredientDetail.new({
      name:         detail.ingredient.name,
      quantity:     detail.quantity,
      measurement:  detail.measurement
    })
  end

end

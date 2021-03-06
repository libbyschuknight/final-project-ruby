class Meal < ActiveRecord::Base
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
  belongs_to :meal_plan

  validates :name, presence: true
  validates :name, length: { minimum: 10 }
  validates :cooking_instructions, presence: true

  def ingredient_details
    details = meal_ingredients.includes(:ingredient)
    details.each_with_object([]) do |detail, result|
      result << IngredientDetail.from_a_meal_ingredient(detail)
    end
  end

  def self.meal_name
    if Meal.new.nil?
      "no meal"
    else
      Meal.new.name
    end
  end
end

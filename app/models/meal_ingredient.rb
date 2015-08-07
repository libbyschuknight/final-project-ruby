class MealIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :meal

  delegate :name, to: :ingredient
end

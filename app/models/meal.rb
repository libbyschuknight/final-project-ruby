class Meal < ActiveRecord::Base
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
  belongs_to :mealPlan


  # refactor - use join table in ActiveRecord to get same info
  def ingredient_details
    details = {}

    ingredients.each do |ingredient|
      details["#{ingredient.name}"] = {}

      details["#{ingredient.name}"]["name"] = ingredient.name



      meal_ingredients.each do |ing|

        details["#{ingredient.name}"]["quantity"] = ing.quantity
        # value["measurement"] =ing.measurement


      end
    end


    # details.each do |key, value|

    # end

    # books[:matz]  = "The Ruby Language"

    details

  end

end


# ingredients.each do |ingredient|
#   # ing_name = ingredient.name
#   details["#{ingredient.name}"] = {}

# end


# meal_ingredients.each do |ingredient|
#   details["#{ing_name}"] ["quantity"] = ingredient.quantity
#   details["#{ing.name}"] ["measurement"] = ingredient.measurement
# end
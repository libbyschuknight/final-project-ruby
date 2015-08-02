class Meal < ActiveRecord::Base
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
  belongs_to :mealPlan


  # def ingredient_details
  #   meal = MealIngredient.find
  #   details = MealIngredient.joins(:meal, :ingredient)

  #   details.each do |item|
  #     item
  #   end

  # end



  # refactor - use join table in ActiveRecord to get same info
  def ingredient_details
    details = {}

    # ingredients.each do |ingredient|
    #   details["#{ingredient.id}"] = {}
    #   details["#{ingredient.id}"]["name"] = ingredient.name
    # end

    # details.each do |key, value|
    #   details[key]["quantity"] = MealIngredient.find(key).quantity
    #   details[key]["measurement"] = MealIngredient.find(key).measurement
    # end



    ingredients.each do |ingredient|
      details["#{ingredient.name}"] = {}
      details["#{ingredient.name}"]["name"] = ingredient.name
    end


    meal_ingredients.each do |ing|
      details.map do |key, value|
        details[key]["quantity"] = ing.quantity
        details[key]["measurement"] = ing.measurement
      end
    end





    # meal_ingredients.each do |ing|

    #   details["#{ingredient.name}"]["quantity"] = ing.quantity
    #   details["#{ingredient.name}"]["measurement"] = ing.measurement
    #   # value["measurement"] =ing.measurement


    # end

    # meal_ingredients.each do |ing|
    #   details.each do |key, value|
    #     key["quantity"] = ing.quantity
    #   end
    # end


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
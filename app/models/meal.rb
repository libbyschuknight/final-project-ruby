class Meal < ActiveRecord::Base
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
  belongs_to :mealPlan


  def ingredient_details

    # Meal.joins(:ingredients, :meal_ingredients)

    # meal = Item.find(item_id)
    name = ingredients.where(:id => id)
    quantity = meal_ingredients.where(:id => id)

  end



  # refactor - use join table in ActiveRecord to get same info
  # def ingredient_details
  #   details = {}

  #     # ingredients.each do |ingredient|
  #     #   details["#{ingredient.name}"] = {}
  #     #   details["#{ingredient.name}"]["name"] = ingredient.name
  #     # end

  #   ingredients.each do |ingredient|
  #     details["#{ingredient.id}"] = {}
  #     details["#{ingredient.id}"]["name"] = ingredient.name
  #   end

  #   # details.map do |key, value|
  #   #   meal_ingredients.each do |ing|
  #   #     details[key]["quantity"] = ing.quantity
  #   #     details[key]["measurement"] = ing.measurement
  #   #   end
  #   # end

  #   details.each do |key, value|
  #     details[key]["quantity"] = MealIngredient.find(key).quantity
  #     details[key]["measurement"] = MealIngredient.find(key).measurement
  #   end



  #   # meal_ingredients.each do |ing|

  #   #   details["#{ingredient.name}"]["quantity"] = ing.quantity
  #   #   details["#{ingredient.name}"]["measurement"] = ing.measurement
  #   #   # value["measurement"] =ing.measurement


  #   # end

  #   # meal_ingredients.each do |ing|
  #   #   details.each do |key, value|
  #   #     key["quantity"] = ing.quantity
  #   #   end
  #   # end




  #   # books[:matz]  = "The Ruby Language"

  #   details

  # end

end


# ingredients.each do |ingredient|
#   # ing_name = ingredient.name
#   details["#{ingredient.name}"] = {}

# end


# meal_ingredients.each do |ingredient|
#   details["#{ing_name}"] ["quantity"] = ingredient.quantity
#   details["#{ing.name}"] ["measurement"] = ingredient.measurement
# end
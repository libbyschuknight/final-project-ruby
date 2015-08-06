class Meal < ActiveRecord::Base
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
  belongs_to :mealPlan


  ### want to store the ingrdients name, quantity and  measurement
  ### have been trying two ways

  ### 1 - storing information in nested hash
  ### I've tried it in a couple of different ways and am getting nested hash but not quite the right info

  def ingredient_details
    details = {}

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


    # ingredients.each do |ingredient|
    #   details["#{ingredient.id}"] = {}
    #   details["#{ingredient.id}"]["name"] = ingredient.name
    # end

    # details.each do |key, value|
    #   details[key]["quantity"] = MealIngredient.find(key).quantity
    #   details[key]["measurement"] = MealIngredient.find(key).measurement
    # end

    details
  end

  ## the output I am getting - for first, second one keys for first hash have just replcaed with the ingredient ID

  # {"spring onions"=>{
  #     "name"=>"spring onions",
  #     "quantity"=>1.0,
  #     "measurement"=>"cup"},
  #   "beef fillet"=>{
  #     "name"=>"beef fillet",
  #     "quantity"=>1.0,
  #     "measurement"=>"cup"},
  #   "soy sauce"=>{
  #     "name"=>"soy sauce",
  #     "quantity"=>1.0,
  #     "measurement"=>"cup"},
  #     "jasmine rice"=>{
  #       "name"=>"jasmine rice",
  #       "quantity"=>1.0,
  #       "measurement"=>"cup"}
  #     }




  ### 2 - as I was struggling with the hash idea, started looking into the activerecord query but don't really know what doing with it
  # def ingredient_details

  #   # Meal.joins(:meal_ingredients)

  #   meal = Meal.joins(:meal_ingredients, :ingredients)

  #   # meal = MealIngredient.find
  #   # details = MealIngredient.joins(:meal, :ingredient)

  #   meal.each do |item|
  #     item.ingredients
  #   end
  # end


end

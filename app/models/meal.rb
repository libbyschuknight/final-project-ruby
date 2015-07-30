class Meal < ActiveRecord::Base
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
  belongs_to :mealPlan


  def ingredient_details
    details = {}

    puts "******INGREDIENTS******"
    ingredients.each do |ingredient|
      # push into hash!!!
      puts ingredient.name
    end

    puts "+++++++++ meal_ingredients +++++++++"
    # puts meal_ingredients

    # "================="
    meal_ingredients do |ingredient|
      puts ingredient.quantity
      puts ingredient.measurement
    end
  end

end

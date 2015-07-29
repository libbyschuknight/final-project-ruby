class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find_by_id(params[:id])

    ing_meal_nums = @meal.meal_ingredients

    @meal_ingredients_info = {}




    meal_hash = { name: ing.name, quantity: ing_qm.quantity, measurement: ing_qm.measurement }
     => {:name=>"spring onions", :quantity=>5.0, :measurement=>"whole"}

    meal_hash
     => {:name=>"spring onions", :quantity=>5.0, :measurement=>"whole"}


    puts "******INGREDIENTS******"
    @meal.ingredients.each do |ingredient|
      puts ingredient.name
    end

    puts "+++++++++ meal_ingredients +++++++++"
    # puts @meal.meal_ingredients

    # "================="
    @meal.meal_ingredients do |ingredient|
      puts ingredient.quantity
      puts ingredient.measurement
    end


    # @ingredient_info = Meal.ingredient_details

    # add in here some sort of method that gets the
    # ingredients details - name
    # and the meal_ingreidents detials - quantity and measurement
    # stores in something? a hash?
    # and then can use in view really easily!!!
  end

  # Meal.ingredient_details(show)

end


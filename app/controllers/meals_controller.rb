class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find_by_id(params[:id])

    # add in here some sort of method that gets the
    # ingredients details - name
    # and the meal_ingreidents detials - quantity and measurement
    # stores in something? a hash?
    # and then can use in view really easily!!!


  end

end


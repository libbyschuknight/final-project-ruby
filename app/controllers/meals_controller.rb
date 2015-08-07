class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
    @ingredient_details = @meal.ingredient_details
  end


end


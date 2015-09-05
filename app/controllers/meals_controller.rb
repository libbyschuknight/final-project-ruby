class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find_by(id: params[:id])

    if @meal == nil
      redirect_to root_path
    else
      @ingredient_details = @meal.ingredient_details
    end
  end
end

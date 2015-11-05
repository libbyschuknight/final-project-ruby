class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find_by(id: params[:id])


    if @meal.nil?
      flash[:error] = "Meal not found"
      redirect_to root_path
    else
      @ingredient_details = @meal.ingredient_details
    end
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.save ? redirect_to(@meal) : redirect_to(new_meal_path)
  end

  private

  def meal_params
    params.require(:meal).permit(:name,
                                 :imageURL,
                                 :cooking_instructions,
                                 :likes,
                                 :dislikes)
  end
end

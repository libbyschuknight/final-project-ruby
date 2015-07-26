class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
    # render json: Ingredient.all.as_json(except: [:created_at, :updated_at])
  end


end

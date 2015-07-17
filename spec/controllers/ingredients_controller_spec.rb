require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  before do
    Ingredient.destroy_all
  end

  xdescribe "#index" do
    before do
      @ingredients = FactoryGirl.create_list(:ingredient, 5)
    end

    it "finds a list of ingredients" do
      get :index, ingredients: @ingredients
      expect(assigns(:ingredients)).to eq(@ingredients)
    end
  end


end

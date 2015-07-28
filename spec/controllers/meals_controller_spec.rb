require 'rails_helper'

RSpec.describe MealsController, type: :controller do

  before do
    Meal.destroy_all
  end


  describe "#index" do
    before do
      @meals = FactoryGirl.create_list(:meal, 4)
    end

    it "finds a list of meals" do
      get :index, meals: @meals
      expect(assigns(:meals)).to eq(@meals)
    end
  end


  describe "#show" do
    before do
      @meal = FactoryGirl.create(:meal)
    end

    it "finds a meal" do
      get :show, id: @meal.id
      expect(assigns(:meal).id).to eq(@meal.id)
    end
  end

end

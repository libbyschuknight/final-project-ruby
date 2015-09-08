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

    # Even though test is passig not sure if correct?
    it "finds a list of ingredients" do
      get :show, id: @meal.id

      expect(assigns(:meal).ingredient_details).to eq(@meal.ingredient_details)
    end

    context "when meal does not exist" do
      before { get :show, id: @meal.id - 1 }

      it "redirects to home page" do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end

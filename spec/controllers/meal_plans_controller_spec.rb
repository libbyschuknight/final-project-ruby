require 'rails_helper'

RSpec.describe MealPlansController, type: :controller do

  before do
    MealPlan.destroy_all
  end

  describe "#index" do
    before do
      @meal_plans = FactoryGirl.create_list(:meal_plan, 4)
    end

    it "finds a list of meal plans" do
      get :index, meal_plans: @meal_plans

      expect(assigns(:meal_plans)).to eq(@meal_plans)
    end

  end
end

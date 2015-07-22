require 'rails_helper'

RSpec.describe MealsController, type: :controller do

  before do
    Meal.destroy.all
  end


  describe "#index" do
    before do
      @meals = FactoryGirl.create_list(:meal, 4)
    end

    it "finds a list of meals" do
      get
    end


  end

end

require 'rails_helper'

RSpec.describe Meal, type: :model do

  describe "meal ingredient details" do

    it "gives back a collection of meal ingredient details", slow: :db do
      meal = FactoryGirl.create(:meal,
               name: "spaghetti bolognese",
               cooking_instructions: "Add things together and cook on stove.")
      pasta = FactoryGirl.create(:ingredient, name: "spaghetti")
      sause = FactoryGirl.create(:ingredient, name: "tomato sause")
      meal_ingredient_1 = FactoryGirl.create(:meal_ingredient, measurement: "half", ingredient: pasta, meal: meal)
      meal_ingredient_2 = FactoryGirl.create(:meal_ingredient, quantity: 250, ingredient: sause, meal: meal)

      expected_result = [
        {
          "name" => "spaghetti",
          "quantity" => 1.5,
          "measurement"=>"half"
        },
        {
          "name" => "tomato sause",
          "quantity" => 250.0,
          "measurement" => "whole"
        }
      ]

      expect(meal.ingredient_details).to eq(expected_result)
    end

  end

end

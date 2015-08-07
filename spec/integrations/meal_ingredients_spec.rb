require 'rails_helper'

RSpec.describe "a meal's ingredient details", type: :integration do

  it "gives back a collection of meal ingredient details", slow: :db do
    meal = FactoryGirl.create(:meal,
             name: "spaghetti bolognese",
             cooking_instructions: "Add things together and cook on stove.")
    pasta = FactoryGirl.create(:ingredient, name: "spaghetti")
    sause = FactoryGirl.create(:ingredient, name: "tomato sause")
    meal_ingredient_1 = FactoryGirl.create(:meal_ingredient, measurement: "half", ingredient: pasta, meal: meal)
    meal_ingredient_2 = FactoryGirl.create(:meal_ingredient, quantity: 250, ingredient: sause, meal: meal)

    result = meal.ingredient_details

    expect(result[0].name).to eq("spaghetti")
    expect(result[0].quantity).to eq(1.5)
    expect(result[0].measurement).to eq("half")
    expect(result[1].name).to eq("tomato sause")
    expect(result[1].quantity).to eq(250)
    expect(result[1].measurement).to eq("whole")
  end

end

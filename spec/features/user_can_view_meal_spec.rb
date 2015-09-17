require 'rails_helper'

# RSpec.feature "UserCanViewMeals", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

feature "User can view a meal" do
  # let(:meal) { FactoryGirl.create(:meal, name: "Five Spice Pork", imageURL: "http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg")}

  # let(:ingredient) { FactoryGirl.create(:ingredient, name: "spring onions")}

  # let(:meal_ingredient) { FactoryGirl.create(:meal_ingredient, ingredient_id: ingredient.id, meal_id: meal.id, quantity: 2)}

  background do
    Meal.destroy_all
    Ingredient.destroy_all
    MealIngredient.destroy_all

    @ingredient = Ingredient.create(name: "spring onions")
    @meal = Meal.create(name: "Five Spice Pork", imageURL: "http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg", cooking_instructions: "Heat half the oil in a wok over high heat. Add spring onions", likes: 0, dislikes: 0)
    MealIngredient.create(ingredient_id: @ingredient.id, meal_id: @meal.id, quantity: 5, measurement: "whole")

    ## Couldn't get FactoryGirl working properly with creating meal_ingredients
      # FactoryGirl.create(:meal, name: "Five Spice Pork", imageURL: "http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg")
      # FactoryGirl.create(:ingredient, name: "spring onions")

      # FactoryGirl.create(:meal_ingredient, ingredient_id: @ingredient.id, meal_id: meal.id, quantity: 2)

    visit meal_path(@meal)
  end

  scenario "it shows a meals' details" do
    # save_and_open_page
    # puts page.body
    expect(page).to have_content(@meal.name)
    expect(page).to have_content("Five Spice Pork")
    expect(page).to have_content("Heat half the oil in a wok over high heat. Add spring onions")
  end

  scenario "it shows a meals' image" do
    expect(page).to have_css("img[src*='http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg']")
    # expect(page).to have_xpath("//image[@src = 'http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg']")
  end

  scenario "it shows the ingredient details" do
    expect(page).to have_content("spring onions")
    expect(page).to have_content("5.0")
  end
end

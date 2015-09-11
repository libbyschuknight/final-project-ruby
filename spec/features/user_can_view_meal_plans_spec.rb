require 'rails_helper'

RSpec.feature "UserCanViewMealPlans", type: :feature do
  feature "User can view all meal plans on the Weekly Meals page" do
    background do
      # destroy all meals, destroy all meal_plans
      Meal.destroy_all
      MealPlan.destroy_all

      @meal1 = FactoryGirl.create(:meal, name: "Beef Noodle Soup")
      @meal2 = FactoryGirl.create(:meal, name: "Pork Fried Rice")
      @meal3 = FactoryGirl.create(:meal, name: "Scrambled Eggs")
      # let(:article) { FactoryGirl.create(:article, title: "Bananas") }

      mon = FactoryGirl.create(:meal_plan, dayOfWeek: "Monday")
      tues = FactoryGirl.create(:meal_plan, dayOfWeek: "Tuesday")
      fri = FactoryGirl.create(:meal_plan, dayOfWeek: "Friday")
      # may not have a meal plan that does not have a meal

      @meal1.update(meal_plan_id: mon.id)
      @meal2.update(meal_plan_id: tues.id)
    end

    scenario "a user can see all meal plans - day and meal" do
      visit meal_plans_path(@meal_plans)

      expect(page).to have_content("Beef Noodle Soup")
      expect(page).to have_content("Friday")
    end

    # "a user can visit the meal plans page" - would this be a feature test from the home page link (to be added) AND from the meal page view - if going off Roa frontend site
    # scenario "user can see all meal plans - days and meals" do
  end
end

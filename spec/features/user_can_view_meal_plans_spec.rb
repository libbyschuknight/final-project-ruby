require 'rails_helper'

RSpec.feature "UserCanViewMealPlans", type: :feature do
  feature "User can view all meal plans on the Weekly Meals page" do
    background do
      # destroy all meals, destroy all meal_plans

      # create meals - 3
      @meal1 = FactoryGirl.create(:meal, name: "Beef Noodle Soup")
      @meal2 = FactoryGirl.create(:meal, name: "Pork Fried Rice")
      @meal3 = FactoryGirl.create(:meal, name: "Scrambled Eggs")
      # let(:article) { FactoryGirl.create(:article, title: "Bananas") }

      # create meal plans and associate with meals - Mon, Tues, Fri
      mon = FactoryGirl.create(:meal_plan, dayOfWeek: "Monday")
      tues = FactoryGirl.create(:meal_plan, dayOfWeek: "Tuesday")
      fri = FactoryGirl.create(:meal_plan, dayOfWeek: "Friday")

      @meal1.update(meal_plan_id: mon.id)
      ## does not work if there is a meal_plan with no meal
      ## would there ever be a meal_plan with no meal?
      @meal2.update(meal_plan_id: tues.id)
      # @meal3.update(meal_plan_id: fri.id)


    end

    scenario "a user can see all meal plans" do
      visit meal_plans_path(@meal_plans)

      expect(page).to have_content("Beef Noodle Soup")
    end

    # "a user can visit the meal plans page" - would this be a feature test from the home page link (to be added) AND from the meal page view - if going off Roa frontend site
    # scenario "user can see all meal plans - days and meals" do


  end
end

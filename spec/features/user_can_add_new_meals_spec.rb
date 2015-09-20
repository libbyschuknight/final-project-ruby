require 'rails_helper'

RSpec.feature "A user can add a new meal", type: :feature do
  background do
    @meal = Meal.new
    visit new_meal_path
  end

  scenario "it shows a form for adding a new meal" do
    expect(page).to have_css("form[action='#{meals_path(@meal)}']")
  end
end

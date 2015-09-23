require 'rails_helper'

RSpec.feature "A user can ", type: :feature do
  scenario "see a form for adding a new meal" do
    visit new_meal_path

    expect(page).to have_content("Create a new meal")
    expect(page).to have_css("form[action='#{meals_path(@meal)}']")
  end
end

RSpec.feature "A user can add a new meal", type: :feature do
  background do
    visit new_meal_path

    fill_in("Meal Name", with: "Chicken Stir Fry") # want to be able to test this without having to have "Meal Name"  as placeholder in view?!
    fill_in "Cooking Instructions", with: "This is where the cooking instructions would go."
    fill_in "Image", with: "http://rasamalaysia.com/images/mee-goreng/meegorengrm.jpg"

    click_button("Create Meal")
  end

  scenario "user can add name and cooking instructions" do
    expect(page).to have_content("Chicken Stir Fry")
    expect(page).to have_content("This is where the cooking instructions would go.")
  end

  scenario "user can add image to a meal"  do
    expect(page).to have_css("img[src*='http://rasamalaysia.com/images/mee-goreng/meegorengrm.jpg']")
  end

  scenario "once user creates a new meal they are redirected to the meal page" do
    expect { click_button("Create meal").to change { Meal.count.byt(1) } }

    expect do
      expect(current_path).to eql(new_meal_path)
      expect(page.current_page).to have_content("Chicken Stir Fry")
    end
  end
end

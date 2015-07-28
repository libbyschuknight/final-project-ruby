require 'rails_helper'

# RSpec.feature "UserCanViewMeals", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

feature "User can view a meal" do
  let(:meal) { FactoryGirl.create(:meal, name: "Five Spice Pork", imageURL: "http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg")}
  # let(:) { FactoryGirl.create(:meal, name: "Five Spice Pork", imageURL: "http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg")} ????

  background { visit meal_path(meal) }


  scenario "it shows a meals' details" do
    # save_and_open_page
    # puts page.body
    expect(page).to have_content(meal.name)
    expect(page).to have_content("Five Spice Pork")
  end

  scenario "it shows a meals' image" do
    expect(page).to have_xpath("//image[@src = 'http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg']")
  end


  scenario "it shows the ingredient details" do
    expect(page).to have_content("spring onions")

  end

end


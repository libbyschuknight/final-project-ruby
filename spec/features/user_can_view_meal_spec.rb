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
    expect(page).to have_content("Heat half the oil in a wok over high heat. Add one-third of the pork and stir-fry for 5 minutes or until brown all over. Transfer to a plate. Repeat, in 2 more batches, with the remaining pork. Step 2 Heat remaining oil in wok over medium heat. Add eschalot and garlic and cook for 5 minutes or until golden. Add pork, soy sauce, palm sugar, water, star anise and five spice. Bring to the boil. Reduce heat to low and cook, covered, stirring occasionally, for 1 1/2 hours or until pork is tender. Increase heat to high and bring to the boil. Cook for 10 minutes or until sauce thickens. Step 3 Add the fish sauce and half the shallot and stir to combine. Place in a serving bowl. Top with remaining shallot. Serve with steamed rice topped with cucumber and coriander leaves.")
  end

  scenario "it shows a meals' image" do
    expect(page).to have_xpath("//image[@src = 'http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg']")
  end


  scenario "it shows the ingredient details" do
    expect(page).to have_content("spring onions")

  end

end


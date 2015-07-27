require 'rails_helper'

# RSpec.feature "UserCanViewListMeals", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

feature "User can view a list of meals on the home page" do

  background do
    Meal.destroy_all
    FactoryGirl.create(:meal, name: "Beef Noodle Soup", imageURL: "http://cdmc.mkcsites.com/~/media/Recipe-Photos/Gourmet/Soups-Stews/1007x545/Vietnamese-Beef-Noodle-Soup_Recipes_1007x545.ashx", cooking_instructions: "Bring stock, soy sauce and spices just to boil in large saucepan. Reduce heat to medium-low; simmer 30 minutes. Remove cloves and cinnamon sticks. Return stock to boil. Cook rice noodles as directed on package. Divide among 4 shallow soup bowls. Cut beef across the grain into thin slices. Divide beef slices, green onions and bean sprouts among the bowls. Pour boiling stock (about 1 cup) into each bowl. Serve with lime wedges, cilantro and mint.", likes: 2, dislikes: 1)
    FactoryGirl.create(:meal, name: "Five Spice Pork", imageURL: "http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg", cooking_instructions: "Heat half the oil in a wok over high heat. Add one-third of the pork and stir-fry for 5 minutes or until brown all over. Transfer to a plate. Repeat, in 2 more batches, with the remaining pork. Step 2 Heat remaining oil in wok over medium heat. Add eschalot and garlic and cook for 5 minutes or until golden. Add pork, soy sauce, palm sugar, water, star anise and five spice. Bring to the boil. Reduce heat to low and cook, covered, stirring occasionally, for 1 1/2 hours or until pork is tender. Increase heat to high and bring to the boil. Cook for 10 minutes or until sauce thickens. Step 3 Add the fish sauce and half the shallot and stir to combine. Place in a serving bowl. Top with remaining shallot. Serve with steamed rice topped with cucumber and coriander leaves.", likes: 0, dislikes: 0)
  end

  scenario "it shows a list of meals" do
    visit meals_path(@meals)

    expect(page).to have_content("Beef Noodle Soup")
    expect(page).to have_content("Five Spice Pork")
  end


  scenario "it shows a meal image" do
    visit meals_path(@meals)

    expect(page).to have_css("img[src*='http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg']")
  end


  scenario "user clicks meal image and is redircted to the meal page" do
    visit meals_path(@meals)
    click_on("http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg")

    expect(page).to have_content("Five Spice Pork")
    expect(page).to have_content("Heat half the oil in a wok over high heat. Add one-third of the pork and stir-fry for 5 minutes or until brown all over. Transfer to a plate. Repeat, in 2 more batches, with the remaining pork. Step 2 Heat remaining oil in wok over medium heat. Add eschalot and garlic and cook for 5 minutes or until golden. Add pork, soy sauce, palm sugar, water, star anise and five spice. Bring to the boil. Reduce heat to low and cook, covered, stirring occasionally, for 1 1/2 hours or until pork is tender. Increase heat to high and bring to the boil. Cook for 10 minutes or until sauce thickens. Step 3 Add the fish sauce and half the shallot and stir to combine. Place in a serving bowl. Top with remaining shallot. Serve with steamed rice topped with cucumber and coriander leaves.")

  end

end


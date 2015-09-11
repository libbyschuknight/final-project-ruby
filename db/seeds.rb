# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
MealIngredient.destroy_all
Meal.destroy_all
Ingredient.destroy_all
MealPlan.destroy_all

spring_onions = Ingredient.create(name: "spring onions")
onions = Ingredient.create(name: "onions")
beef = Ingredient.create(name: "beef fillet")
soy = Ingredient.create(name: "soy sauce")
rice = Ingredient.create(name: "jasmine rice")
pork = Ingredient.create(name: "pork fillet")
kumara = Ingredient.create(name: "kumara")
chicken = Ingredient.create(name: "chicken")
feta = Ingredient.create(name: "feta")
oregano = Ingredient.create(name: "oregano")
lemon = Ingredient.create(name: "lemon")

beef_noodle = Meal.create(name: "Beef Noodle Soup", imageURL: "http://cdmc.mkcsites.com/~/media/Recipe-Photos/Gourmet/Soups-Stews/1007x545/Vietnamese-Beef-Noodle-Soup_Recipes_1007x545.ashx", cooking_instructions: "Bring stock, soy sauce and spices just to boil in large saucepan. Reduce heat to medium-low; simmer 30 minutes. Remove cloves and cinnamon sticks. Return stock to boil. Cook rice noodles as directed on package. Divide among 4 shallow soup bowls. Cut beef across the grain into thin slices. Divide beef slices, green onions and bean sprouts among the bowls. Pour boiling stock (about 1 cup) into each bowl. Serve with lime wedges, cilantro and mint.", likes: 0, dislikes: 0)


pork_5 = Meal.create(name: "Five Spice Pork", imageURL: "http://www.taste.com.au/images/recipes/agt/2006/12/14680_l.jpg", cooking_instructions: "Heat half the oil in a wok over high heat. Add one-third of the pork and stir-fry for 5 minutes or until brown all over. Transfer to a plate. Repeat, in 2 more batches, with the remaining pork. Step 2 Heat remaining oil in wok over medium heat. Add eschalot and garlic and cook for 5 minutes or until golden. Add pork, soy sauce, palm sugar, water, star anise and five spice. Bring to the boil. Reduce heat to low and cook, covered, stirring occasionally, for 1 1/2 hours or until pork is tender. Increase heat to high and bring to the boil. Cook for 10 minutes or until sauce thickens. Step 3 Add the fish sauce and half the shallot and stir to combine. Place in a serving bowl. Top with remaining shallot. Serve with steamed rice topped with cucumber and coriander leaves.", likes: 0, dislikes: 0)

lemon_chicken = Meal.create(name: "Lemon Feta Chicken", imageURL: "https://butterpoached.files.wordpress.com/2014/03/p1010601.jpg", cooking_instructions: "Cook chicken, add feta and oregano, put in oven on 200C for 20 minutes.", likes: 2, dislikes: 0)

MealIngredient.create(ingredient_id: spring_onions.id, meal_id: beef_noodle.id, quantity: 5, measurement: "whole")
MealIngredient.create(ingredient_id: beef.id, meal_id: beef_noodle.id, quantity: 200, measurement: "grams")
MealIngredient.create(ingredient_id: soy.id, meal_id: beef_noodle.id, quantity: 2, measurement: "tablespoons")
MealIngredient.create(ingredient_id: rice.id, meal_id: beef_noodle.id, quantity: 1, measurement: "cup")


MealIngredient.create(ingredient_id: spring_onions.id, meal_id: pork_5.id, quantity: 2, measurement: "whole")
MealIngredient.create(ingredient_id: pork.id, meal_id: pork_5.id, quantity: 300, measurement: "grams")


MealIngredient.create(ingredient_id: chicken.id, meal_id: lemon_chicken.id, quantity: 200, measurement: "grams")
MealIngredient.create(ingredient_id: feta.id, meal_id: lemon_chicken.id, quantity: 100, measurement: "grams")
MealIngredient.create(ingredient_id: oregano.id, meal_id: lemon_chicken.id, quantity: 5, measurement: "sprigs")
MealIngredient.create(ingredient_id: lemon.id, meal_id: lemon_chicken.id, quantity: 2, measurement: "teaspoons")

mon = MealPlan.create(dayOfWeek: "Monday", eaten: false)
tues = MealPlan.create(dayOfWeek: "Tuesday", eaten: false)
wed = MealPlan.create(dayOfWeek: "Wednesday", eaten: false)
fri = MealPlan.create(dayOfWeek: "Friday", eaten: false)

beef_noodle.update(meal_plan_id: mon.id)
pork_5.update(meal_plan_id: tues.id)

lemon_chicken.update(meal_plan_id: fri.id)

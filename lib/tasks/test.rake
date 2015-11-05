require 'csv'

namespace :test do
  desc "create model"
  task run: :environment do
    CSV.open("meal.csv", "wb") do |csv|

      Meal.all.each do |meal|
        csv << meal.attributes.values
      end

      Ingredient.all.each do |ing|
        csv << ing.attributes.values
      end

      MealPlan.all.each do |plan|
        csv << plan.attributes.values
      end

      MealIngredient.all.each do |ing|
        csv << ing.attributes.values
      end
    end
  end
end

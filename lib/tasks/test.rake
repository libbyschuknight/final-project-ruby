namespace :test do
  desc "create model"
  task create_model: :environment do
    @meal = Meal.create(name: "beef stuff")

  end


  desc "TODO"
  task ar_model: [:create_model]  do
    p @meal

  end
end

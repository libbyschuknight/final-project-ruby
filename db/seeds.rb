# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ingredient.destroy_all


Ingredient.create(name: "spring onions")
Ingredient.create(name: "onions")
Ingredient.create(name: "beef fillet")
Ingredient.create(name: "soy sauce")
Ingredient.create(name: "jasmine rice")
Ingredient.create(name: "pork fillet")
Ingredient.create(name: "kumera")


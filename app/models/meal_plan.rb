class MealPlan < ActiveRecord::Base
  has_one :meal
  belongs_to :user
end

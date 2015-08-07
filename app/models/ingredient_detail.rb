class IngredientDetail

  attr_reader :name, :quantity, :measurement

  def self.from_a_meal_ingredient(meal_ingredient)
    new({
      name:         meal_ingredient.name,
      quantity:     meal_ingredient.quantity,
      measurement:  meal_ingredient.measurement
    })
  end

  def initialize(attributes)
    @name        = attributes.fetch(:name)
    @quantity    = attributes.fetch(:quantity)
    @measurement = attributes.fetch(:measurement)
  end

end

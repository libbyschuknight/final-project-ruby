class IngredientDetail

  attr_reader :name, :quantity, :measurement

  def initialize(attributes)
    @name        = attributes.fetch(:name)
    @quantity    = attributes.fetch(:quantity)
    @measurement = attributes.fetch(:measurement)
  end

end

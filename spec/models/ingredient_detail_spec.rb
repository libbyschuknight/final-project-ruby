require "./app/models/ingredient_detail"

RSpec.describe IngredientDetail, type: :model do

  describe "creating a new one" do

    let(:ingredient_detail) do
      IngredientDetail.new({
        name: "toast",
        quantity: 2,
        measurement: 2
      })
    end

    it "has a name" do
      expect(ingredient_detail.name).to eq("toast")
    end

    it "has a quantity" do
      expect(ingredient_detail.quantity).to eq(2)
    end

    it "has a measurement" do
      expect(ingredient_detail.measurement).to eq(2)
    end

  end

end

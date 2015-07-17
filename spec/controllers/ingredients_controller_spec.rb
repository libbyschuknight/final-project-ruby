require 'rails_helper'
require 'airborne' # for testing JSON output when will be API


RSpec.describe IngredientsController, type: :controller do
  before do
    Ingredient.destroy_all
  end

  # controller test before rendering output as JSON
  describe "#index" do
    before do
      @ingredients = FactoryGirl.create_list(:ingredient, 5)
    end

    it "finds a list of ingredients" do
      get :index, ingredients: @ingredients
      expect(assigns(:ingredients)).to eq(@ingredients)
    end
  end





  ###### Trying to do JSON testing - haven't got working yet :(  ####
  # this is likely to be in the right place as airborne gem works with rspec-rails
  # describe "GET index" do
  #   before do
  #     # @ingredients = FactoryGirl.create_list(:ingredient, 5)
  #     @ingredients = []
  #     @ingredients << Ingredient.create(name: "spring onions")
  #   end

  #   it "should validate types" do
  #     get :index, :format => 'json' #if your route responds to both html and json
  #     expect_json_types({id: :int, name: :string})
  #   end

    # it "should validate values" do
    #   get :index
    #   expect_json({:name => "spring onions"})
    # end
  # end


  # wanting to test rendering JSON
    # using gem 'Airborne' - https://github.com/brooklynDev/airborne/blob/master/README.md
    # not sure if this is the right place or if should be in a feature spec file?

  # describe '#index JSON rendering' do
  #   it 'should validate types' do
  #     get 'http://localhost:3000/ingredients' #json api that returns { "name" : "spring onions" }
  #     expect_json_types({name: :string})
  #   end

  #   # it 'should validate values' do
  #   #   get 'http://example.com/api/v1/simple_get' #json api that returns { "name" : "John Doe" }
  #   #   expect_json({:name => "John Doe"})
  #   # end
  # end


end

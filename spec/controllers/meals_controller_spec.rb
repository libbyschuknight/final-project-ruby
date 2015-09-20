require 'rails_helper'

RSpec.describe MealsController, type: :controller do
  before do
    Meal.destroy_all
  end

  describe "#index" do
    before do
      @meals = FactoryGirl.create_list(:meal, 4)
    end

    it "finds a list of meals" do
      get :index, meals: @meals
      expect(assigns(:meals)).to eq(@meals)
    end
  end

  describe "#show" do
    before do
      @meal = FactoryGirl.create(:meal)
    end

    it "finds a meal" do
      get :show, id: @meal.id

      expect(assigns(:meal).id).to eq(@meal.id)
    end

    # Even though test is passig not sure if correct?
    it "finds a list of ingredients" do
      get :show, id: @meal.id

      expect(assigns(:meal).ingredient_details).to eq(@meal.ingredient_details)
    end

    context "when meal does not exist" do
      before { get :show, id: @meal.id - 1 }

      it "redirects to home page" do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "#new" do
    before do
      get :new
    end

    it "returns a new meal page" do
      expect(response).to render_template(:new)
    end

    it "assigns an instance of Meal to @meal" do
      expect(assigns(:meal)).to be_an_instance_of(Meal)
    end
  end

  describe "#create" do
    context "if parameters are valid" do
      before do
        @valid_params = FactoryGirl.attributes_for(:meal)
        post :create, { :meal => @valid_params }
        @meal = Meal.find_by(@valid_params)
      end

      it "creates a new meal" do
        expect(@meal).to be_truthy
      end

      it "redirects to show meal details" do
        expect(response).to redirect_to(meal_path(@meal))
      end
    end

    context "if parameters are invalid" do
      before do
        @invalid_params = FactoryGirl.attributes_for(:meal, name: "",
          cooking_instructions: "")
        post :create, { :meal => @invalid_params }
        @meal = Meal.find_by(@invalid_params)
      end

      it "a new meal is not created" do
        expect(@meal).to be_falsey
      end
    end
  end
end

require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before do
    User.destroy_all
  end

  describe "#index" do
    before do
      @users = FactoryGirl.create_list(:user, 4)
    end

    it "finds a list of users" do
      get :index, users: @users

      expect(assigns(:users)).to eq(@users)
    end

  end

  describe "#show" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "shows a user" do
      get :show, id: @user.id

      expect(assigns(:user).id).to eq(@user.id)
    end

  end

end

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  #hash of attributes to pass through spec
  let(:new_user_attributes) do
    {
        name: "BlocHead",
        email: "blochead@bloc.io",
        password: "blochead",
        password_confirmation: "blochead"
    }
  end

  #Creating new user
  describe "GET new" do

    #Expects HTTP response code of 200
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    #Expects a new user to be created
    it "instantiates a new user" do
      get :new
      expect(assigns(:user)).to_not be_nil
    end
  end

  #action called when the new view's form is submitted with valid attributes
  describe "POST create" do

    #test the create action for HTTP success when issuing a POST with  new_user_attributes set as the params hash
    it "returns an http redirect" do
      post :create, params: { user: new_user_attributes }
      expect(response).to have_http_status(:redirect)
    end

    #test that the database count on the users table increases by one when we issue a POST to create
    it "creates a new user" do
      expect{
        post :create, params: { user: new_user_attributes }
      }.to change(User, :count).by(1)
    end

    #test that we set user.name properly when creating a user
    it "sets user name properly" do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).name).to eq new_user_attributes[:name]
    end

    #test that we set user.email properly when creating a user
    it "sets user email properly" do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).email).to eq new_user_attributes[:email]
    end

    #test that we set user.password properly when creating a user
    it "sets user password properly" do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).password).to eq new_user_attributes[:password]
    end

    #test that we set user.password_confirmation properly when creating a user
    it "sets user password_confirmation properly" do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
    end
  end



end

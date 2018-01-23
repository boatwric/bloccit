#Tests to make sure that post_controller.rb is working correctly
#let(:my_post) data methods comes from db/seeds.rb

require 'rails_helper'

RSpec.describe PostsController, type: :controller do #tells rspec this is going to be a controller test, so we can simulate actions like HTTP tests

  let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) } #passes in random data post, see seeds.rb
  
  describe "GET #index" do #performs a GET on the index view, expects response to be sucessful
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [my_post] to @posts" do
      get :index
      expect(assigns(:posts)).to eq([my_post]) #expect index to return an array of one item [my_post]
    end
  end

  #ALL THESE OTHER TESTS GET ADDED LATER
  
  #describe "GET #show" do #performs a GET on the show view, expects response to be sucessful; so on for the other two
  #  it "returns http success" do
  #    get :show
  #    expect(response).to have_http_status(:success)
  #  end
  #end

  #describe "GET #new" do
  #  it "returns http success" do
  #    get :new
  #    expect(response).to have_http_status(:success)
  #  end
  #end

  #describe "GET #edit" do
  #  it "returns http success" do
  #    get :edit
  #    expect(response).to have_http_status(:success)
  #  end
  #end

end

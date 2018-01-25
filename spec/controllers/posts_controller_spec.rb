#Tests to make sure that post_controller.rb is working correctly
#let(:my_post) data methods comes from db/seeds.rb
#relationship between :new and :create methods- https://www.youtube.com/watch?v=YCcAE2SCQ6k and https://en.wikipedia.org/wiki/Representational_state_transfer

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
  
  describe "GET #show" do #performs a GET on the show view, expects response to be sucessful; so on for the other two
  
    it "returns http success" do
      get :show, params: { id: my_post.id } #we pass {id: my_post.id} to show as a parameter. These parameters are passed to the  params hash (http://guides.rubyonrails.org/action_controller_overview.html#parameters)
      expect(response).to have_http_status(:success)
    end
      
    it "renders the #show view" do
      get :show, params: { id: my_post.id } 
      expect(response).to render_template :show #expect the response to return the show view using the render_template matcher (https://relishapp.com/rspec/rspec-rails/docs/matchers/render-template-matcher)
    end

    it "assigns my_post to @post" do
      get :show, params: { id: my_post.id }
      expect(assigns(:post)).to eq(my_post) #expect the post to equal my_post because we call show with the id of  my_post. We are testing that the post returned to us is the post we asked for
    end

  end

  describe "GET new" do #new post is created, not saved; GETS don't create data
    
    it "returns http success" do #http://www.rubydoc.info/gems/rspec-rails/RSpec%2FRails%2FMatchers%3Ahave_http_status
      get :new 
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do  #expect PostController#new to render new view with render_template method (https://apidock.com/rails/ActionController/Base/render_template)
      get :new
      expect(response).to render_template :new 
    end

    it "instantiates @post" do ##expect the @post instance variable to be initialized by PostsController#new; assigns gives us access to the @post variable, assigning it to :post.
      get :new
      expect(assigns(:post)).not_to be_nil 
    end
  
  end

  describe "POST create" do #new object is persisted in database; POSTS create data

    it "increases the number of Post by 1" do #expect that after PostsController#create is called with the parameters  (below), the count of Post instances (i.e. rows in the posts table) in the database will increase by one.
      expect{ post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)
    end

    it "assigns the new post to @post" do #when create is POSTed to, we expect the newly created post to be assigned to @post
      post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(assigns(:post)).to eq Post.last
    end

    it "redirects to the new post" do #expect to be redirected to the newly created post
      post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(response).to redirect_to Post.last
    end

  end

  #describe "GET #edit" do
  #  it "returns http success" do
  #    get :edit
  #    expect(response).to have_http_status(:success)
  #  end
  #end

end

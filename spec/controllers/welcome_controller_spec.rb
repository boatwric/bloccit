require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do #describes subject of spec, WelcomeController
    
    describe "GET index" do
        it "renders the index template" do
            get :index #use get to call the index method of WelcomeController
            expect(response).to render_template("index") #expect controller's response to be rendering index template
        end
    end

    describe "GET about" do
        it "renders the about template" do
            get :about
            expect(response).to render_template("about")
        end
    end

    describe "GET faq" do
        it "renders the faq template" do
            get :faq
            expect(response).to render_template("faq")
        end
    end

end

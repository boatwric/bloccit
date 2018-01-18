require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") } #create new Post class, call it :post, lets it be called within spec
 
  describe "attributes" do #attributes are like the header columns of a spreadsheet
      it "has title and body attributes" do #looks to see if those columns exist
        expect(post).to have_attributes(title: "New Post Title", body: "New Post Body") #expects to find the attibutes and values assigned by :post
      end
    end
end

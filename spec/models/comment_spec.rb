#MAKES SURE EVERYTHING IS WORKING PROPERLY WITH THE COMMENT MODEL

require 'rails_helper' #need rails-helper for this to work

RSpec.describe Comment, type: :model do
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") } #let :post be a new instance of the Post class which gets tested
  let(:comment) { Comment.create!(body: 'Comment Body', post: post) } #let :commment be a new instance of the Comment class that references the post just created

  describe "attributes" do
    it "has a body attribute" do
      expect(comment).to have_attributes(body: "Comment Body") #Does the comment have a body with this text in it? 
    end
  end
end

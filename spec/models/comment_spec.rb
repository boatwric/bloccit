#MAKES SURE EVERYTHING IS WORKING PROPERLY WITH THE COMMENT MODEL

require 'rails_helper' #need rails-helper for this to work

RSpec.describe Comment, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) } #creates a parent topic
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) } #associates post with topic; uses topic.post.create! chain method
  let(:comment) { Comment.create!(body: 'Comment Body', post: post) } #let :commment be a new instance of the Comment class that references the post just created

  describe "attributes" do
    it "has a body attribute" do
      expect(comment).to have_attributes(body: "Comment Body") #Does the comment have a body with this text in it? 
    end
  end
end

require 'rails_helper'

RSpec.describe Post, type: :model do
  #create post attributes
  let(:name) { RandomData.random_sentence } 
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  
  let(:topic) { Topic.create!(name: name, description: description) } #creates parent topic for post
  let(:post) { topic.posts.create!(title: title, body: body) } #associate post with topic via topic.posts.create! ; chained method call which creates a post for a given topic

  it { is_expected.to belong_to(:topic) } #post expected to belong to topic
  
  describe "attributes" do #attributes are like the header columns of a spreadsheet
      it "has title and body attributes" do #looks to see if those columns exist
        expect(post).to have_attributes(title: title, body: body)
      end
    end
end

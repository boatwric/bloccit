#MAKES SURE EVERYTHING IS WORKING PROPERLY WITH THE ANSWER MODEL

require 'rails_helper' #need rails-helper for this to work

RSpec.describe Answer, type: :model do
    let(:question) { Question.create!(title: "New Question Title", body: "New Question Body", resolved: false) } #let :question be a new instance of the Question model which gets tested
    let(:answer) { Answer.create!(body: 'Answer Body', question: question) } #let :answer be a new instance of the Answer model that references the post just created
    
    describe "attributes" do
        it "has a body attribute" do
            expect(answer).to have_attributes(body: "Answer Body") #Does the answer have a body with this text in it?
        end
    end
end

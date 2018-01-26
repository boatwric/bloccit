require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) { Advertisement.create!(title: "New Ad Title", copy: "New Ad Body", price; 99) } 
 
  describe "attributes" do #attributes are like the header columns of a spreadsheet
      it "has title and copy and price attributes" do #looks to see if those columns exist
        expect(advertisement).to have_attributes(title: "New Ad Title", copy: "New Ad Body", price: 99) 
      end
    end
end
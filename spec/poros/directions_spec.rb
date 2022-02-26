require 'rails_helper'

RSpec.describe Directions do
  #route[:legs].first[:maneuvers].map
  let!(:attributes) {
      {
      route: {
        formattedTime: "00:01:00",
        legs: [
          {maneuvers: [ {narrative: "Start out going southeast on 17th St toward Larimer St/CO-33."},
                     {narrative: "Turn right onto Larimer St/CO-33."},
                     {narrative: "Turn right onto 15th St/CO-33."} ]
              } ]
        }
      }
    }

  let!(:directions) {Directions.new(attributes)}
  it 'exists' do
    expect(directions).to be_a(Directions)
  end

  it "has attributes" do
    expect(directions.travel_time).to eq("00:01:00")
    expect(directions.instructions).to be_a(Array)
  end 
end

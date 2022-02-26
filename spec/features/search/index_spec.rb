require 'rails_helper'

RSpec.describe 'Search Results Index' do
  # Then I should see the closest electric fuel station to me.
  #
  # For that station I should see
  # - Name
  # - Address
  # - Fuel Type
  # - Access Times
  #
  # I should also see:
  # - the distance of the nearest station (should be 0.1 miles)
  # - the travel time from Turing to that fuel station (should be 1 min)
  # - The direction instructions to get to that fuel station
  #   "Turn left onto Lawrence St Destination will be on the left"
  it 'displays the neartest station and its attributes', :vcr do
    visit '/'
    select "Turing", from: :location
    click_on "Find Nearest Station"

    expect(page).to have_content("Station Name: 16M BUILDING 16M B-1")
    expect(page).to have_content("Address: 1550 Market St, Denver, CO, 80202")
    expect(page).to have_content("Fuel Type: ELEC")
    expect(page).to have_content("Access Times: 24 hours daily")
    expect(page).to have_content("Distance: 0.12 miles")
  end

  it 'displays the distance, travel time, and directions to the the nearest station' do
    VCR.use_cassette('call-both') do
      visit '/'
      select "Turing", from: :location
      click_on "Find Nearest Station"

      expect(page).to have_content("Est Travel Time: 00:01:00")
      expect(page).to have_content("Directions")
      expect(page).to have_content("Start out going southeast on 17th St toward Larimer St/CO-33.")
      expect(page).to have_content("Turn right onto Larimer St/CO-33.")
      expect(page).to have_content("Turn right onto 15th St/CO-33.")
      expect(page).to have_content("Turn right onto Market St.")
      expect(page).to have_content("1550 MARKET ST is on the right.")
    end
  end
end

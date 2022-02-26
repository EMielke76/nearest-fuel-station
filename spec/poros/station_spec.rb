require 'rails_helper'

RSpec.describe Station do
  let!(:attributes) { {
      access_days_time: "24 hours daily",
      fuel_type_code: "ELEC",
      station_name: "16M Building 16M B-1",
      street_address: "1550 Market St",
      city: "Denver",
      state: "CO",
      zip: "80202",
      distance: 0.1226
    } }

  let!(:station) {Station.new(attributes)}

  it 'exists' do
    expect(station).to be_a(Station)
  end

  it 'has attributes' do
    expect(station.name).to eq("16M Building 16M B-1")
    expect(station.fuel_type).to eq("ELEC")
    expect(station.address).to eq("1550 Market St, Denver, CO, 80202")
    expect(station.access_times).to eq("24 horus daily")
  end
end

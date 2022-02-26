require 'rails_helper'

RSpec.describe StationService do
  context 'instance methods' do
    context '#find_station(address)' do
      it 'retuns Station data' do
        VCR.use_cassette('env-station-search') do
          query = StationService.new
          results = query.find_station('1331 17th St, Denver, CO 80202')

          expect(results).to be_a(Hash)
          expect(results).to have_key(:fuel_stations)
          expect(results[:fuel_stations]).to be_a(Array)

          first_station = results[:fuel_stations].first

          expect(first_station).to have_key(:access_days_time)
          expect(first_station[:access_days_time]).to be_a(String)

          expect(first_station).to have_key(:fuel_type_code)
          expect(first_station[:fuel_type_code]).to be_a(String)

          expect(first_station).to have_key(:station_name)
          expect(first_station[:station_name]).to be_a(String)

          expect(first_station).to have_key(:city)
          expect(first_station[:city]).to be_a(String)

          expect(first_station).to have_key(:state)
          expect(first_station[:state]).to be_a(String)

          expect(first_station).to have_key(:street_address)
          expect(first_station[:street_address]).to be_a(String)

          expect(first_station).to have_key(:zip)
          expect(first_station[:zip]).to be_a(String)

          expect(first_station).to have_key(:distance)
          expect(first_station[:distance]).to be_a(Float)
        end
      end
    end
  end
end

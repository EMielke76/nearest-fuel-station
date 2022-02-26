require 'rails_helper'

RSpec.describe DirectionsService do
  context 'instance methods' do
    context '.get_directions(from, to)' do
      it 'returns directions data' do
        VCR.use_cassette('get_directions') do
          from = '1331 17th St, Denver, CO 80202'
          to = '1550 Market St, Denver, CO, 80202'
          query = DirectionsService.new
          results = query.get_directions(from, to)

          expect(results).to be_a(Hash)
          expect(results).to have_key(:route)

          route = results[:route]

          expect(route).to have_key(:formattedTime)
          expect(route[:formattedTime]).to be_a(String)

          expect(route).to have_key(:legs)
          expect(route[:legs]).to be_a(Array)

          directions = route[:legs].first
          
          expect(directions).to have_key(:maneuvers)
          expect(directions[:maneuvers]).to be_a(Array)

          directions[:maneuvers].each do |maneuver|
            expect(maneuver).to have_key(:narrative)
          end
        end
      end
    end
  end
end

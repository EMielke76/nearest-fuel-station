require 'rails_helper'

RSpec.describe DirectionsService do
  context 'instance methods' do
    context '.get_directions(from, to)' do
      it 'returns directions data' do
        VCR.use_cassette('get_directions') do
          from = '1331 17th St, Denver, CO 80202'
          to = '1550 Market St, Denver, CO, 80202'
          query = DirectionService.new
          results = query.get_directions(from, to)

          expect(results).to be_a(Hash)
          expect(results).to have_key(:formattedTime)
          expect(results[:formattedTime]).to be_a(String)

          expect(results).to have_key(:legs)
          expect(results[:legs]).to be_a(Array)

          directions = results[:legs].first

          expect(directions).to have_key(:maneuvers)
          expect(directions[:maneuvers]).to be_a(Array)

          directions[:maneuvers].each do |maneuver|
            expect(maneuver).to have_key[:narrative]
          end
        end
      end
    end
  end
end

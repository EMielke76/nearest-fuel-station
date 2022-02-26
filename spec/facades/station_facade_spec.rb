require 'rails_helper'

RSpec.describe StationFacade do
  describe 'instance methods' do
    describe '.find_search(address)' do
      it "returns Station data", :vcr do
        query = StationFacade.new
        results = query.find_station('1331 17th St, Denver, CO 80202')
        
        expect(results).to be_a(Array)
        results.each do |result|
          expect(result).to be_a(Station)
        end
      end
    end
  end
end

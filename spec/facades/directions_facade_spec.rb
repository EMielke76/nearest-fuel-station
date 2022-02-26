require 'rails_helper'

RSpec.describe DirectionsFacade do
  context "instance methods" do
    context ".get_directions(from, to)" do
      it 'returns Directions data', :vcr do
        from = '1331 17th St, Denver, CO 80202'
        to = '1550 Market St, Denver, CO, 80202'
        query = DirectionsFacade.new
        results = query.get_directions(from, to)

        expect(results).to be_a(Array)
        results.each do |result|
          expect(result).to be_a(Directions)
        end 
      end
    end
  end
end

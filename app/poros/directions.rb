class Directions
  attr_reader :travel_time,
              :instructions

  def initialize(attributes)
    @travel_time = attributes[:route][:formattedTime]
    @instructions = attributes[:route][:legs].first[:maneuvers].map {|narrative| narrative[:narrative]}
  end
end

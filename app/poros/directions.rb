class Directions
  attr_reader :travel_time,
              :instructions

  def initialize(attributes)
    @travel_time = attributes[:formattedTime]
    @instructions = attributes[:legs].first[:maneuvers].map {|narrative| narrative[:narrative]}
  end
end

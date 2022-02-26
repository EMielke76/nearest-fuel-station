class Station
  attr_reader :name,
              :fuel_type,
              :address,
              :access_times,
              :distance

  def initialize(attributes)
    @name = attributes[:station_name]
    @fuel_type = attributes[:fuel_type_code]
    @address = attributes[:street_address] + ", " + attributes[:city] + ", " + attributes[:state]+ ", " + attributes[:zip]
    @access_times = attributes[:access_days_time]
    @distance = attributes[:distance]
  end
end

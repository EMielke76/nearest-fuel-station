class StationFacade

  def find_station(address)
    service.find_station(address)[:fuel_stations].map do |station_data|
      Station.new(station_data)
    end
  end

  def service
    StationService.new
  end
end

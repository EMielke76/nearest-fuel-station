class DirectionsFacade

  def get_directions(from, to)
    Directions.new(service.get_directions(from, to)[:route])
  end

  def service
    DirectionsService.new
  end
end

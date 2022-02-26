class SearchController < ApplicationController

  def index
    @station = StationFacade.new.find_station(params[:location]).first
    @directions = DirectionsFacade.new.get_directions(params[:location], @station.address)
  end
end

class SearchController < ApplicationController

  def index
    @station = StationFacade.new.find_station(params[:location]).first
  end
end

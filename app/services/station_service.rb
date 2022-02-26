require 'faraday'
require 'json'

class StationService

  def find_station(address)
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?fuel=ELEC&location=#{address}&radius=0.5")
    body = parse_json(response)
  end

  private
  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.params['api_key'] = ENV['electric_api']
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

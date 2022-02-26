require 'faraday'
require 'json'

class DirectionsService

  def get_directions(from, to)
    response = conn.get("/directions/v2/route?&from=#{from}&to=#{to}")
    body = parse_json(response)
  end

  private
  def conn
    Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
      faraday.params['key'] = ENV['map_quest_api']
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

class Foursquare
  extend Forwardable
  def_delegators :@client, :venue, :search_venues, :venue_hours

  def initialize
    @client = Foursquare2::Client.new(
      client_id: Rails.application.secrets.foursq_client_id,
      client_secret: Rails.application.secrets.foursq_client_secret,
      api_version: '20150427'
    )
  end
end

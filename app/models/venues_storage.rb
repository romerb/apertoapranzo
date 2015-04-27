class VenuesStorage
  def initialize
    @cache = Redis.new
  end

  def get(venue_id)
     get!(venue_id) || set(venue_id)
  end

  private
  def get!(venue_id)
    venue = @cache.get(venue_id)
    return JSON.parse(venue) if venue
    false
  end

  def set(venue_id)
    venue = get_venue venue_id
    @cache.setex venue_id, 1.week.seconds, venue.to_json
    venue
  end

  def get_venue(venue_id)
    foursquare.venue venue_id
  end

  private
  def foursquare
    @client ||= Foursquare.new
  end
end

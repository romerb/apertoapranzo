class VenuesStorage
  def initialize
    @cache = Redis.new
  end

  def get(venue)
     get!(venue) || set(venue)
  end

  private
  
  def get!(venue)
    cached_venue = @cache.get(venue.id)
    return JSON.parse(cached_venue) if cached_venue
    false
  end

  def set(venue)
    venue = get_venue venue
    @cache.setex venue.id, 1.week.seconds, venue.to_json
    venue
  end

  def get_venue(venue)
    venue.merge(foursquare.venue_hours venue.id)
  end

  def foursquare
    @client ||= Foursquare.new
  end
end

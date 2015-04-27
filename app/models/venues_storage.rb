class VenuesStorage
  def initialize
    @cache = Redis.new
  end

  def get(venue_id)
    @cache.get(venue_id) || set(venue_id)
  end

  private
  def set(venue_id)
    venue = get_venue venue_id
    @cache.setex venue_id, 1.week.seconds, venue
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

class PagesController < ApplicationController
  def home
  end

  def search
    response = client.search_venues(ll: "#{params[:lat]},#{params[:lon]}")
    venues = response.venues.map do |venue|
      venues_storage.get venue.id
    end
    render json: venues
  end

  private
  def client
    @client ||= Foursquare.new
  end

  def venues_storage
    @venues_storage ||= VenuesStorage.new
  end
end

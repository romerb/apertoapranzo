class PagesController < ApplicationController
  def home
  end

  def search
    response = client.search_venues(ll: "#{params[:lat]},#{params[:lon]}", categoryId: "4d4b7105d754a06374d81259", radius: "1000")
    venues = response.venues.map do |venue|
      venues_storage.get venue
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

class PagesController < ApplicationController
  def home
  end

  def search
    render json: client.search_venues(ll: "#{params[:lat]},#{params[:lon]}")
  end

  private
  def client
    Foursquare2::Client.new(
      client_id: Rails.application.secrets.foursq_client_id,
      client_secret: Rails.application.secrets.foursq_client_secret,
      api_version: '20150427'
    )
  end
end

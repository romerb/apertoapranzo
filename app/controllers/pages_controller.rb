class PagesController < ApplicationController
  def home
    
  end

  def search
    puts Rails.application.secrets
    client = Foursquare2::Client.new(client_id: Rails.application.secrets.foursq_client_id, client_secret: Rails.application.secrets.foursq_client_id, :api_version => '20120609')
    client.search_venues(ll: "#{params[:lat]},#{params[:lon]}")
  end 

end

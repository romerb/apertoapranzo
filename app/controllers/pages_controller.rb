class PagesController < ApplicationController
  def home
  end

  def search
    uri = URI("https://api.foursquare.com/v2/venues/search?client_id=#{Rails.application.secrets.foursq_client_id}&client_secret=#{Rails.application.secrets.foursq_client_secret}&ll=#{params[:lat]},#{params[:lon]}&v=20120609")

    @response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      http.request Net::HTTP::Get.new uri
    end
    render json: @response.body
  end
end

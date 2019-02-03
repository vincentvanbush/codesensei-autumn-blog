class WeatherController < ApplicationController
  def show
    city = params[:city]
    address = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['OWM_APPID']}"
    response = Net::HTTP.get(URI(address))
    parsed_response = JSON.parse(response)
    temp_celsius = parsed_response['main']['temp'] - 273.15

    respond_to do |format|
      format.json do
        render json: { temp_celsius: temp_celsius }
      end
    end
  end
end

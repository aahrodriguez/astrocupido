class AstrologyChartsController < ApplicationController

  def index
    @astrology_charts = AstrologyChart.all
  end

  def create
    @user = current_user
    @user.update(user_params)
    @astrology_chart = AstrologyChart.new
    clientInstance = VRClient.new(ENV["ASTROLOGY_USER_ID"], ENV["ASTROLOGY_API_KEY"])
    response = clientInstance.call("/western_horoscope/", @user.birthdate.day, @user.birthdate.month, @user.birthdate.year, @user.birthdate.hour, @user.birthdate.min, lat, lon, @user.birthdate.zone)
    @astrology_chart.sun_id = response["planets"][0]["sign_id"]
    @astrology_chart.moon_id = response["planets"][1]["sign_id"]
    @astrology_chart.ascendant_id = response["ascendant"][0]["sign_id"]
    @astrology_chart.save
  end

  private

  def user_params
    params.require(:user).permit(:birthdate, :birth_city)
  end

end


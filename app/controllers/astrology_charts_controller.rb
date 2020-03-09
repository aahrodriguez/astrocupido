class AstrologyChartsController < ApplicationController

  def index
    @astrology_charts = AstrologyChart.all
  end

  def new
    @states = State.all.pluck(:state_name)
    @user = current_user
  end

  def create
    @user = current_user
    @user.update(user_params)
    @astrology_chart = AstrologyChart.new(user: current_user)
    clientInstance = AstrologyService.new(ENV["ASTROLOGY_USER_ID"], ENV["ASTROLOGY_API_KEY"])
    response = clientInstance.call("planets/tropical",
      @user.birthdate.day,
      @user.birthdate.month,
      @user.birthdate.year,
      @user.birthdate.hour,
      @user.birthdate.min,
      @user.latitude,
      @user.longitude,
      -3)
    response_parsed = JSON.parse(response)
    @astrology_chart.sun_id = Sign.find_by(sign_name: response_parsed[0]["sign"])&.id
    @astrology_chart.moon_id = Sign.find_by(sign_name: response_parsed[1]["sign"])&.id
    @astrology_chart.ascendant_id = Sign.find_by(sign_name: response_parsed[10]["sign"])&.id
    @astrology_chart.save
  end

  private

  def user_params
    params.permit(:birthdate, :birth_city)
  end

end


class AstrologyChartsController < ApplicationController

  def index
    @astrology_charts = AstrologyChart.all
  end

  def new
    @astrology_chart = AstrologyChart.new
    @states = State.all.pluck(:state_name)
  end

  def create
    @astrology_chart = AstrologyChart.new(astrology_chart_params)
    @astrology_chart.user = current_user
    @astrology_chart.state = State.find_by(state_name: params[:astrology_chart][:state_id])
    clientInstance = AstrologyService.new(ENV["ASTROLOGY_USER_ID"], ENV["ASTROLOGY_API_KEY"])
    if @astrology_chart.save
      response = clientInstance.call("planets/tropical",
        @astrology_chart.birthdate.day,
        @astrology_chart.birthdate.month,
        @astrology_chart.birthdate.year,
        @astrology_chart.birthdate.hour,
        @astrology_chart.birthdate.min,
        @astrology_chart.latitude,
        @astrology_chart.longitude,
        -3)
      response_parsed = JSON.parse(response)
      @astrology_chart.sun_id = Sign.find_by(sign_name: response_parsed[0]["sign"])&.id
      @astrology_chart.moon_id = Sign.find_by(sign_name: response_parsed[1]["sign"])&.id
      @astrology_chart.ascendant_id = Sign.find_by(sign_name: response_parsed[10]["sign"])&.id
      if @astrology_chart.save
        redirect_to all_users_path
      else
        render :new
      end
    else
      raise
      render :new
    end
  end

  def edit
    @states = State.all.pluck(:state_name)
    @astrology_chart = AstrologyChart.find_by(user_id: current_user)
  end

  def update
    @astrology_chart = AstrologyChart.find_by(user_id: current_user)
    @astrology_chart.state = State.find_by(state_name: params[:astrology_chart][:state_id])
    clientInstance = AstrologyService.new(ENV["ASTROLOGY_USER_ID"], ENV["ASTROLOGY_API_KEY"])
    if @astrology_chart.update(astrology_chart_params)
      response = clientInstance.call("planets/tropical",
        @astrology_chart.birthdate.day,
        @astrology_chart.birthdate.month,
        @astrology_chart.birthdate.year,
        @astrology_chart.birthdate.hour,
        @astrology_chart.birthdate.min,
        @astrology_chart.latitude,
        @astrology_chart.longitude,
        -3)
      response_parsed = JSON.parse(response)
      @astrology_chart.sun_id = Sign.find_by(sign_name: response_parsed[0]["sign"])&.id
      @astrology_chart.moon_id = Sign.find_by(sign_name: response_parsed[1]["sign"])&.id
      @astrology_chart.ascendant_id = Sign.find_by(sign_name: response_parsed[10]["sign"])&.id
      @astrology_chart.save
      redirect_to my_profile_path
    else
      render :edit
    end
  end

  private

  def astrology_chart_params
    params.require(:astrology_chart).permit(:birthdate, :birth_city)
  end

end


class AstrologyChartsController < ApplicationController

  def index
    @astrology_charts = AstrologyChart.all
  end

  def new
    @user = current_user
    @astrology_chart = AstrologyChart.new
  end

end

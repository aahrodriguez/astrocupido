class UsersController < ApplicationController

  def index
    users = User.where.not(id: current_user.id)

    # we have a user
    # we gonna get their interactions (has_many / belongs_to)
    # we gonna get the senders from these interactions
    # we gonna check if any of therse senders is the current_user
    users.reject! { |user| user.interactions.senders.include? current_user }

    users = users.sort_by { |user|
        (SignMatch.find_by(s1: current_user.astrology_chart.sun_id, s2: user.astrology_chart.sun_id).percentage * 3)
      + (SignMatch.find_by(s1: current_user.astrology_chart.moon_id, s2: user.astrology_chart.moon_id).percentage * 2)
      + (SignMatch.find_by(s1: current_user.astrology_chart.ascendant_id, s2: user.astrology_chart.ascendant_id).percentage) }

    @best_match = users.first
  end

  def show
    # public page of the user
    @user = User.find_by(username: params[:slug])

  end

  def my_profile
    @user = current_user
  end

  def edit
    @user = current_user
  end
end

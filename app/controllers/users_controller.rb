class UsersController < ApplicationController

  def index

    # we have a user
    # we gonna get their interactions (has_many / belongs_to)
    # we gonna get the senders from these interactions
    # we gonna check if any of therse senders is the current_user
    # users = User.where.not(id: current_user.id).left_joins(:interactions)
    # users = users.where(interactions: {like: true, receiver: current_user})
    #                          .or(users.where.not(interactions: {sender: current_user}))
    # @users = User.where.not(id: current_user.id)
      @users = User.all
    # users = users.sort_by { |user|
    #     (SignMatch.find_by(s1: current_user.astrology_chart.sun_id, s2: user.astrology_chart.sun_id).percentage * 3)
    #   + (SignMatch.find_by(s1: current_user.astrology_chart.moon_id, s2: user.astrology_chart.moon_id).percentage * 2)
    #   + (SignMatch.find_by(s1: current_user.astrology_chart.ascendant_id, s2: user.astrology_chart.ascendant_id).percentage) }

    # @best_match = users
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

  def update
    @user = current_user
    if @user.update(user_update_params)
      redirect_to all_users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password )
  end

  def user_update_params
    params.require(:user).permit(:username, :email, :password )
  end

end

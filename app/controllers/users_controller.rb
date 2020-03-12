class UsersController < ApplicationController

  def index
    # Pra nao quebrar na master, linha nao esta correta
    users = User.where.not(id: current_user.id).joins('LEFT JOIN interactions ON interactions.sender_id = users.id OR interactions.receiver_id = users.id')
    users =  users.reject { |user| user.interactions.pluck(:sender_id).include? current_user.id }

    users = users.sort_by { |user|
         (SignMatch.find_by(sign_one_id: current_user.astrology_chart.sun_id, sign_two_id: user.astrology_chart.sun_id).percentage * 3)
       + (SignMatch.find_by(sign_one_id: current_user.astrology_chart.moon_id, sign_two_id: user.astrology_chart.moon_id).percentage * 2)
       + (SignMatch.find_by(sign_one_id: current_user.astrology_chart.ascendant_id, sign_two_id: user.astrology_chart.ascendant_id).percentage) }
    @best_match = users.first
  end

  def show
    @user = User.find(params[:id])
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

  def edit_preferences
    @user = User.find(params[:id])
  end

  def update_preferences
    raise
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password )
  end

  def user_update_params
    params.require(:user).permit(:username, :email, :password )
  end

end

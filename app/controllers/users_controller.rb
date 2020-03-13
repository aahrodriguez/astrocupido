class UsersController < ApplicationController

  def index
    # Pra nao quebrar na master, linha nao esta correta
    users = User.where.not(id: current_user.id).joins('LEFT JOIN interactions ON interactions.sender_id = users.id OR interactions.receiver_id = users.id')
    users =  users.reject { |user| user.interactions.pluck(:sender_id).include? current_user.id }

    users = users.sort_by { |user| current_user.match_percentage(user) }

    @best_match = users.first
    @match_percentage = current_user.match_percentage(@best_match) if @best_match.present?
  end

  def show
    @user = User.find(params[:id])
    @match_percentage = current_user.match_percentage(@user)
    @sun_percentage = current_user.sun_percentage(@user)
    @moon_percentage = current_user.moon_percentage(@user)
    @ascendant_percentage = current_user.ascendant_percentage(@user)
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
    @user = User.find(params[:id])
    raise
    @user.update(user_params)
    redirect_to my_profile_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :description, :like_man, :like_woman, :avatar, :gender)
  end

  def user_update_params
    params.require(:user).permit(:username, :email, :password, :current_address)
  end

end

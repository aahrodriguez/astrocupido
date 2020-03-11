class InteractionsController < ApplicationController

  def new
  end

  def create
    @interaction = Interaction.new
    @interaction.sender_id = current_user.id
    @interaction.receiver_id = params[:receiver]
    @interaction.like = params[:like]
      if @interaction.save
        like_interaction = Interaction.where(sender_id: params[:receiver], receiver: current_user, like: true)
        if like_interaction && @interaction.like
          @match = Match.create(user_one_id: current_user.id, user_two_id: params[:receiver])
        end
        best_match
        redirect_to all_users_path(@best_match)
      else
        @user = User.find(params[:receiver])
        render { "users/show" }
      end
    end

  private

  def best_match
    users = User.where.not(id: current_user.id).joins('LEFT JOIN interactions ON interactions.sender_id = users.id OR interactions.receiver_id = users.id')
    users =  users.reject { |user| user.interactions.pluck(:sender_id).include? current_user.id }

    users = users.sort_by { |user|
         (SignMatch.find_by(sign_one_id: current_user.astrology_chart.sun_id, sign_two_id: user.astrology_chart.sun_id).percentage * 3)
       + (SignMatch.find_by(sign_one_id: current_user.astrology_chart.moon_id, sign_two_id: user.astrology_chart.moon_id).percentage * 2)
       + (SignMatch.find_by(sign_one_id: current_user.astrology_chart.ascendant_id, sign_two_id: user.astrology_chart.ascendant_id).percentage) }
    @best_match = users.first
  end
end

class InteractionsController < ApplicationController

  def new
  end

  def create
    @interaction = Interaction.new
    @interaction.sender_id = current_user
    @interaction.receiver_id = User.find(params[:id])
      if @interaction.save
        best_match
        respond_to do |format|
          format.html { redirect_to all_users_path(@best_match) }
          format.js
        end
      else
        @user = User.find(params[:id])
        respond_to do |format|
          format.html { render "users/show" }
          format.js
        end
      end
    end

  private

  def best_match
    users = User.where.not(id: current_user.id).left_joins(:interactions)
    users = users.where.not(interactions: {sender: current_user})

    users = users.sort_by { |user|
         (SignMatch.find_by(s1: current_user.astrology_chart.sun_id, s2: user.astrology_chart.sun_id).percentage * 3)
       + (SignMatch.find_by(s1: current_user.astrology_chart.moon_id, s2: user.astrology_chart.moon_id).percentage * 2)
       + (SignMatch.find_by(s1: current_user.astrology_chart.ascendant_id, s2: user.astrology_chart.ascendant_id).percentage) }
    @best_match = users.first
  end
end

class MatchesController < ApplicationController


  def index
    @matches = current_user.matches
  end

  def show
    @match = Match.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

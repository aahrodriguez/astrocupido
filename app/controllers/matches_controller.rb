class MatchesController < ApplicationController

def show
  @match = Match.find(params[:id])
  @message = Message.new
end

private

def message_params
  params.require(:match).permit(:match_id)
end

end

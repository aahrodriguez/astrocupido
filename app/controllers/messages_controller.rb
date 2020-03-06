class MessagesController < ApplicationController


  def create
    @message = Message.new(message_params)
    @message.match = Match.find(params[:match_id])
    @message.sender = current_user
    @message.save
    redirect_to match_path(params[:match_id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

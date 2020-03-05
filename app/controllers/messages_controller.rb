class MessagesController < ApplicationController


  def create
    @message.match = Match.find(params[:match_id])
    @message = Message.new()
    @message.content = params(:content)
    @message.save
  end

  def new
    @message = Message.new

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

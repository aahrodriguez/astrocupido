class MatchChatChannel < ApplicationCable::Channel
  def subscribed
    stream_for "match_channel_#{params[:id]}"
  end
end

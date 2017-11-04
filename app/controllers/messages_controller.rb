class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @message  = Message.new
  end

  def create
    @groups = current_user.groups
    @message  = Message.new(message_params)
    if @message.save
      render :index, notice: 'メッセージを送信しました。'
    else
      render :index , alert: 'メッセージ送信に失敗しました。'
    end
  end

  private
    def message_params
        params.require(:message).permit(:id,:image,:name, :image_cache, :remove_image, body:[])
    end
end

class MessagesController < ApplicationController
  before_action :get_group , only: [:index, :create]

  def index
    @message_users = @message.user
  end
  def create
    @message_users = @message.user(message_params)
      if @message_users.save
      redirect_to group_messages_path , notice: 'メッセージを作成しました。'
      else
      flash.now[:alert] =  'メッセージ送信に失敗しました。'
      render :index
      end
  end

  private
    def message_params
        params.require(:message).permit(:image, :body,:user_id).merge( group_id:params[:group_id])
    end
    def get_group
      @message  = Message.new
      @group =Group.find(params[:group_id])
      @groups = current_user.groups
      @messages = @group.messages
  end
end

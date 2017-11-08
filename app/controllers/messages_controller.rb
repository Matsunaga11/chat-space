class MessagesController < ApplicationController
  before_action :get_group , only: [:index, :create]

  def index
    @message  = Message.new

  end

  def create
    @message  = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path , notice: 'メッセージを作成しました。'
    else
      flash.now[:alert] =  'メッセージ送信に失敗しました。'
      render :index
    end
  end

  private
    def message_params
        params.require(:message).permit(:image, :body).merge(user_id: current_user.id, group_id:params[:group_id])
    end

    def get_group
      @group =Group.find(params[:group_id])
      @groups = current_user.groups
      @messages = @group.messages
  end

end

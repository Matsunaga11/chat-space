class GroupsController < ApplicationController

  def new
@group = Group.new

  end
 def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました。'
    else
      redirect_to new_group_path , alert: 'グループ作成に失敗しました。'
    end
  end

  private
    def group_params
      params.require(:group).permit(:name, user_ids:[])
    end
end

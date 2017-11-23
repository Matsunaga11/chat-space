class UsersController < ApplicationController
  def edit
      @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
     if user.update(tweet_params)
     render "messages/index"
     else render :edit
     end
  end

  def index
  @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").limit(3)
  respond_to do |format|
  format.html { redirect_to edit_group_path(params[:group_id]) }
  format.json
    end
  end

 private
  def tweet_params
     params.permit(:name, :email)
  end
 end

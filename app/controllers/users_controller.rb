class UsersController < ApplicationController
  def edit
      @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(tweet_params)
  end
end


 private
  def tweet_params
     params.permit(:name, :email)
  end




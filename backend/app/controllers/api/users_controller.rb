class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      render json: {user: @user}
    else
      render json: ['error']
    end

  end
  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

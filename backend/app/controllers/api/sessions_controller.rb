class Api::SessionsController < ApplicationController
  def show

   render json: (current_user ? {user: current_user} : {user: nil})
    # current_user ? render json: {user: current_user} :  render json: {user: nil}

  end

  def create

    @user = User.find_by_credentials(params[:credential], params[:password])

    if @user
      login!(@user)
      render json: {user: @user}
    else
      render json: {errors: ['The provided credentials were invalid.']}, status: :unauthorized
    end
  end

  def destroy
    logout! if current_user
    render json: ['you have successfuly logged out :)']
  end
end

class AuthController < ApplicationController
  include BCrypt

  def create
    @user = User.find_by(email: user_params[:email])

    if @user && @user.password == user_params[:password]
      token = encode_user_data({ user_data: @user.id })
      # return to user
      render json: { token: token, user: @user }, status: :accepted
    elsif @user == nil
      render json: {error: ["invalid credentials"]}, status: :not_found
    elsif @user.password != user_params[:password]
      puts @user.password
      puts user_params[:password]
      render json: {error: ["password incorrect"]}, status: :not_found
    else
      render json: {error: @user.errors.full_messages}, status: :not_found
    end
  end

  private
  def user_params
    params.require(:user).permit(:email,  :password)
  end
end
class UsersController < ApplicationController
  include BCrypt

  def index
    users = User.all
    render json: users, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      token = encode_user_data({ user_data: @user.id })
      render json: {user: @user, token: token}, status: :ok
    else
      render json: {error: @user.errors.full_messages},  status: :bad_request
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
  end
end

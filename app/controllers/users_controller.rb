class UsersController < ApplicationController
  include BCrypt
  def new
    @user = User.new
  end

  def index
    users = User.all
    render json: users, status: 200
  end

  def create
    @user = User.new(params[:user])
    if @user.valid?

    else
      redirect_to
    end
  end
end

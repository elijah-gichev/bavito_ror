class UsersController < ApplicationController
  include BCrypt
  def new
    @user = User.new
  end


  def create
    @user = User.new(params[:user])
    if @user.valid?

    else
      redirect_to
    end
  end
end

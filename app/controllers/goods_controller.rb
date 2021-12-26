class GoodsController < ApplicationController
  before_action :authentication

  def index
    goods = Good.all
    render json: goods, status: :accepted
  end

  def create
    good = Good.new(
      user: User.find_by(id: good_params[:user_id]),
      title: good_params[:title],
      description: good_params[:description],
      image_url: good_params[:image_url],
      points: good_params[:points]
      )

    if good.valid?
      good.save
      render json: {good: good}, status: :created
    else
      render json: {error: good.errors.full_messages},  status: :bad_request
    end
  end

  def show
    good = Good.find_by(id: params[:id])

    if good
      render json: good, status: :ok
    else
      render json: {error: "Product not found."}, status: :not_found
    end
  end

  private
  def request_params
    params.require(:good).permit([
      :user_id,
      :title,
      :description,
      :image_url,
      :points])
  end

end

class GoodsController < ApplicationController
  def index
    goods = Good.all
    render json: goods, status: 200
  end

  def create
    good = Good.new(
      name: good_params[:name],
      description: good_params[:description],
      image_url: good_params[:image_url]
      )
  end

  def show
    good = Good.find_by[id: params[:id]]
    if good
      render json: good, status: 200
    else
      render json: {error: "Product not found."}
    end
  end

  private
  def good_params
    params.require(:good).permit([
      :name,
      :description,
      :image_url])
  end

end

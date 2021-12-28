class ProductsController < ApplicationController
  before_action :authentication

  def index
    products = Product.all
    render json: products, status: :accepted
  end

  def create
    product = Product.new(
      user: User.find_by(id: product_params[:user_id]),
      title: product_params[:title],
      description: product_params[:description],
      image_url: product_params[:image_url],
      points: product_params[:points]
      )

    if product.valid?
      product.save
      render json: {product: product}, status: :created
    else
      render json: {error: product.errors.full_messages},  status: :bad_request
    end
  end

  def show
    product = Product.find_by(id: params[:id])

    if product
      render json: product, status: :ok
    else
      render json: {error: "Product not found."}, status: :not_found
    end
  end

  private
  def request_params
    params.require(:product).permit([
      :user_id,
      :title,
      :description,
      :image_url,
      :points])
  end

end

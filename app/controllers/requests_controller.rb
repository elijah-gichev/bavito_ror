class RequestsController < ApplicationController

   def index
     requests = Request.all
     render json: requests, status: :accepted
   end

  def create
    request = Request.new(
      creator_id: product_params[:creator_id],
      sender_id: product_params[:sender_id],
      recipient_id: product_params[:recipient_id],
      sender_good_id: product_params[:sender_good_id],
      recipient_good_id: product_params[:recipient_good_id],
      comment: product_params[:comment],
      status: product_params[:status]
    )

    if request.valid?
      request.save
      render json: {request: request}, status: :created
    else
      render json: {error: request.errors.full_messages},  status: :bad_request
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
  def product_params
    params.require(:request).permit([
                                   :creator_id,
                                   :sender_id,
                                   :recipient_id,
                                   :sender_good_id,
                                   :recipient_good_id,
                                   :comment,
                                   :status])
  end

end

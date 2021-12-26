class RequestsController < ApplicationController
  # before_action :authentication

  # def index
  #   goods = Good.all
  #   render json: goods, status: :accepted
  # end

  def create



    request = Request.new(
      creator_id: good_params[:creator_id],
      sender_id: good_params[:sender_id],
      recipient_id: good_params[:recipient_id],
      sender_good_id: good_params[:sender_good_id],
      recipient_good_id: good_params[:recipient_good_id],
      comment: good_params[:comment],
      status: good_params[:status]
    )

    puts good_params

    if request.valid?
      request.save
      render json: {request: request}, status: :created
    else
      render json: {error: request.errors.full_messages},  status: :bad_request
    end
  end

  # def show
  #   good = Good.find_by(id: params[:id])
  #
  #   if good
  #     render json: good, status: :ok
  #   else
  #     render json: {error: "Product not found."}, status: :not_found
  #   end
  # end

  private
  def good_params
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

class RequestsController < ApplicationController
   def index
     requests = Request.all
     render json: requests, status: :ok
   end

   def accept
     req = Request.find_by(id: params[:request_id])
     decode_data = decode_user_data(request.headers["token"])
     user_id = decode_data[0]["user_data"] unless !decode_data
     if (user_id == params[:user_id])
       if (user_id == req.recipient_id and req.status == "DEFAULT")
         p1 = Product.find_by(id: req.sender_good_id)
         p1.user_id = req.recipient_id

         p2 = Product.find_by(id: req.recipient_good_id)
         p2.user_id = req.sender_id

         req.status = "EXCHANGED"

         req.save
         p1.save
         p2.save
         render json: req, status: :ok
       else
         render json: { message: "No rights" }, status: :forbidden
       end
     else
       render json: {message: "Token validation failed"}, status: :forbidden
     end

   end

   def decline
     req = Request.find_by(id: params[:request_id])
     decode_data = decode_user_data(request.headers["token"])
     user_id = decode_data[0]["user_data"] unless !decode_data
     if (user_id == params[:user_id])
       if (req.status == "DEFAULT")
         req.status = "DELETED"
         render json: req, status: :ok
       else
         render json: { message: "Already declined" }, status: :forbidden
       end
     else
       render json: {message: "Token validation failed"}, status: :forbidden
     end


   end

  def create
    request = Request.new(
      creator_id: params[:user_id],
      sender_id: req_params[:sender_id],
      recipient_id: req_params[:recipient_id],
      sender_good_id: req_params[:sender_good_id],
      recipient_good_id: req_params[:recipient_good_id],
      comment: req_params[:comment],
      status: req_params[:status]
    )

    if request.valid?
      request.save
      render json: {request: request}, status: :ok
    else
      render json: {error: request.errors.full_messages},  status: :bad_request
    end
  end



  def show
    request = Request.find_by(id: params[:request_id])

    if request
      render json: request, status: :ok
    else
      render json: {error: "Request not found."}, status: :not_found
    end
  end

  private
  def req_params
    params.require(:request).permit([
                                   :sender_id,
                                   :recipient_id,
                                   :sender_good_id,
                                   :recipient_good_id,
                                   :comment,
                                   :status])
  end

end

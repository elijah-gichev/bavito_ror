class RequestsController < ApplicationController
  def index
    requests = Request.all
    render json: requests, status: 200
  end


end


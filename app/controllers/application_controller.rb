class ApplicationController < ActionController::API
  SECRET = "yoursecretword"

  def authentication

    # making a request to a secure route, token must be included in the headers
    decode_data = decode_user_data(request.headers["token"])

    puts decode_data

    # getting user id from a nested JSON in an array.
    user_id = decode_data[0]["user_data"] unless !decode_data
    # find a user in the database to be sure token is for a real user
    user = User.find_by(id: user_id)

    if user
      return true
    else
      render json: { message: "invalid credentials" }, status: :forbidden
    end
  end



  # turn user data (payload) to an encrypted string  [ B ]
  def encode_user_data(payload)
    JWT.encode payload, SECRET, "HS256"
  end


  # decode token and return user info, this returns an array, [payload and algorithms] [ B ]
  def decode_user_data(token)
    begin
      JWT.decode token, SECRET, true, { algorithm: "HS256" }
    rescue => e
      puts e
    end
  end

end

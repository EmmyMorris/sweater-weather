class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(user_params[:password])
      render json: UsersSerializer.new(user), status: 200
    else
      render json: { error: "Invalid Credentials." }, status: 400
    end
  end

  private
    def user_params
      params.permit(:email, :password)
    end
end

class ApplicationController < ActionController::Base
  # def error_response(error, status_code = 404)
  #   render json: {
  #     data: {
  #       message: "your query could not be completed",
  #       errors: error}
  #     },
  #     status: status_code
  # end
  skip_before_action :verify_authenticity_token
end

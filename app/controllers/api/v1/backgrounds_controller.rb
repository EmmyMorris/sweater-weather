class Api::V1::BackgroundsController < ApplicationController
  def index
    # require "pry"; binding.pry
    background = BackgroundFacade.get_image(params[:location])
    render json: BackgroundSerializer.new(background), status: 200
  end
end

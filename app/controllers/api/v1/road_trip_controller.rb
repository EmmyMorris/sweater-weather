class Api::V1::RoadTripController < ApplicationController
  def create
    authenticated_user = User.find_by(api_key: road_trip_params[:api_key])
    if authenticated_user
      if road_trip = RoadTripFacade.create_trip(road_trip_params[:origin], road_trip_params[:destination])
        render json: RoadtripSerializer.new(road_trip)
      else
        render json: { error: "Invalid Credentials." }, status: 400
      end
    else
      render json: { error: "Invalid Api Key." }, status: 400
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end

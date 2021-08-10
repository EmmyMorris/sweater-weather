require "rails_helper"

RSpec.describe "Road Trip API", :vcr do
  describe "user creates road trip" do
    it "Creates a road trip" do
      User.destroy_all
      post '/api/v1/users', params: {
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      }
      body = JSON.parse(response.body, symbolize_names: true)
      user = User.find(body[:data][:id].to_i)

      post "/api/v1/road_trip", params: {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: user.api_key
      }

      road_trip = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json")
      expect(response.status).to eq(200)

      expect(road_trip).to be_a(Hash)
      expect(road_trip).to have_key(:data)

      expect(road_trip[:data]).to be_a(Hash)
      expect(road_trip[:data]).to have_key(:type)
      expect(road_trip[:data][:type]).to eq('roadtrip')
      expect(road_trip[:data]).to have_key(:id)
      expect(road_trip[:data][:id]).to be_nil
      expect(road_trip[:data]).to have_key(:attributes)

      expect(road_trip[:data][:attributes]).to be_a(Hash)
      expect(road_trip[:data][:attributes]).to have_key(:start_city)
      expect(road_trip[:data][:attributes][:start_city]).to be_a(String)
      expect(road_trip[:data][:attributes]).to have_key(:end_city)
      expect(road_trip[:data][:attributes][:end_city]).to be_a(String)
      expect(road_trip[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip[:data][:attributes][:travel_time]).to be_a(String)
      expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end

    it "Doesnt create if apikey is not authenticated" do
      post "/api/v1/road_trip", params: {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: 'key'
      }
      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      expect(response.body).to eq("Invalid Api Key")
    end

    it "Doesn't create if no destination" do
      post '/api/v1/users', params: {
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      }
      body = JSON.parse(response.body, symbolize_names: true)
      user = User.find(body[:data][:id].to_i)

      post "/api/v1/road_trip", params: {
        origin: "Denver,CO",
        destination: "",
        api_key: user.api_key
      }

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response.body).to eq("Destination Required.")
    end

    it "user creates a road trip with unsuccessful locations" do
      User.destroy_all
      post '/api/v1/users', params: {
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      }
      body = JSON.parse(response.body, symbolize_names: true)
      user = User.find(body[:data][:id].to_i)

      post "/api/v1/road_trip", params: {
        origin: "Denver,CO",
        destination: "London,UK",
        api_key: user.api_key
      }

      road_trip = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json")
      expect(response.status).to eq(200)

      expect(road_trip).to be_a(Hash)
      expect(road_trip).to have_key(:data)
      expect(road_trip[:data]).to be_a(Hash)
      expect(road_trip[:data]).to have_key(:type)
      expect(road_trip[:data][:type]).to eq('roadtrip')
      expect(road_trip[:data]).to have_key(:id)
      expect(road_trip[:data][:id]).to be_nil
      expect(road_trip[:data]).to have_key(:attributes)

      expect(road_trip[:data][:attributes]).to be_a(Hash)
      expect(road_trip[:data][:attributes]).to have_key(:start_city)
      expect(road_trip[:data][:attributes][:start_city]).to be_a(String)
      expect(road_trip[:data][:attributes][:start_city]).to eq("Denver,CO")
      expect(road_trip[:data][:attributes]).to have_key(:end_city)
      expect(road_trip[:data][:attributes][:end_city]).to be_a(String)
      expect(road_trip[:data][:attributes][:end_city]).to eq("London,UK")
      expect(road_trip[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip[:data][:attributes][:travel_time]).to be_a(String)
      expect(road_trip[:data][:attributes][:travel_time]).to eq("impossible")
      expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to be_nil
    end
  end
end

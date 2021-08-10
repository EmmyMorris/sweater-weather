require 'rails_helper'

RSpec.describe "Sessions API" do
  describe 'Create a session from user log in' do
    it 'Create a session when a user logs in' do
      post '/api/v1/users', params: {
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      }
      body = JSON.parse(response.body, symbolize_names: true)
      user = User.find(body[:data][:id].to_i)


      post '/api/v1/sessions', params: {
        email: "test@example.com",
        password: "password"
      }
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data][:attributes][:email]).to eq("test@example.com")
      expect(body[:data][:attributes][:api_key]).to eq(user.api_key)
    end
  end
end

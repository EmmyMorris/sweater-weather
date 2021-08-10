require "rails_helper"

RSpec.describe "User API" do
  describe 'User can be created' do
    before(:each) do
      User.destroy_all
    end
    it "a new user can be created" do
      post "/api/v1/users",  params = {
            "email": "test@example.com",
            "password": "password",
            "password_confirmation": "password"
          }
      response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.content_type).to eq("application/json")

      expect(response[:data]).to have_key(:type)
      expect(response[:data][:type]).to be_a(String)
      expect(response[:data][:type]).to eq('users')
      expect(response[:data]).to have_key(:id)
      expect(response[:data][:id]).to be_a(String)
      expect(response[:data]).to have_key(:attributes)
      expect(response[:data][:attributes]).to be_a(Hash)
      expect(response[:data][:attributes]).to have_key(:email)
      expect(response[:data][:attributes][:email]).to be_a(String)
      expect(response[:data][:attributes]).to have_key(:api_key)
      expect(response[:data][:attributes][:api_key]).to be_a(String)


      user = User.last
      expect(user).to be_a(User)
      expect(user.email).to eq(params[:email])
      expect(user.api_key).to be_a(String)
    end
  end

  it 'Cannot create user' do
    post "/api/v1/users", params: {
      "email": "test@example.com"
    }

    body = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(422)
    expect(body[:error]).to eq("Credentials invalid.")
  end
end

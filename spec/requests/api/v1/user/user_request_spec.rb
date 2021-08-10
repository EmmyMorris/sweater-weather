require "rails_helper"

RSpec.describe "User API" do
  describe 'User can be created' do
    before(:each) do
      User.destroy_all
    end
    it "a new user can be created" do
      post "/api/v1/users",  params: {
            email: "test@example.com",
            password: "password",
            password_confirmation: "password"
          }

      user = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json")

      expect(user[:data]).to have_key(:type)
      expect(user[:data][:type]).to be_a(String)
      expect(user[:data][:type]).to eq('users')
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_a(String)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to be_a(Hash)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:api_key)
      expect(user[:data][:attributes][:api_key]).to be_a(String)


      user_last = User.last
      expect(user_last).to be_a(User)
      expect(user_last.email).to eq("test@example.com")
      expect(user_last.api_key).to be_a(String)
    end
  end

  it 'Cannot create user' do
    post "/api/v1/users", params: {
      email: "test@example.com"
    }

    body = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(422)
    expect(body[:error]).to eq("Invalid Credentials.")
  end
end

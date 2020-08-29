require 'rails_helper'

RSpec.describe "Users", type: :request do
  before(:each) do
    @valid_user = User.create username: 'admin', password: '123', password_confirmation: '123'
  end
  context 'login request' do 
    it 'should return the user object id if credentials logged in' do
      post '/users/login', params: {
        username: 'admin',
        password: '123'
      }
      response_obj = JSON.parse(response.body)
      expect(response_obj["id"]).not_to eq(nil)
    end

    it 'should return user username if credentials logged in' do
      post '/users/login', params: {
        username: 'admin',
        password: '123'
      }
      response_obj = JSON.parse(response.body)
      expect(response_obj["username"]).to eq(@valid_user.username)
    end
  end
  context 'sign up request' do
    it 'should create a new user object in database' do 
      post '/users', params: {
        username: 'test',
        password: '123',
        password_confirmation: '123'
      }
      expect(User.find_by(username: 'test').username).to eq('test')
    end

    it 'should return the user object' do
      post '/users', params: {
        username: 'test',
        password: '123',
        password_confirmation: '123'
      }
      response_obj = JSON.parse(response.body)
      expect(response_obj["username"]).to eq('test')
    end

    it 'should return an error message if username is not provided' do
      post '/users', params: {
        username: '',
        password: '123',
        password_confirmation: '123'
      }
      response_obj = JSON.parse(response.body)
      expect(response_obj["errors"][0]).to eq("Username can't be blank")
    end

    it 'should return an error message if password is not provided' do
      post '/users', params: {
        username: 'test',
        password: '',
        password_confirmation: ''
      }
      response_obj = JSON.parse(response.body)
      expect(response_obj["errors"][0]).to eq("Password can't be blank")
    end

    it 'should return an error message if username already exists' do
      User.create username: 'admin', password: '123', password_confirmation: '123'
      post '/users', params: {
        username: 'admin',
        password: '123',
        password_confirmation: '123'
      }
      response_obj = JSON.parse(response.body)
      expect(response_obj["errors"][0]).to eq("Username has already been taken")
    end

  end
end

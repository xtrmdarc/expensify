require 'rails_helper'

RSpec.describe 'Measurements', type: :request do
  it 'should return code 0 no category id or user id exist' do
    post '/measurement/create', params: {
      ex_cat_id: 1,
      date: '2020-08-02',
      user_id: 1,
      value: 203.50
    }
    response_obj = JSON.parse(response.body)
    expect(response_obj['code']).to eq(0)
  end
  it 'should return code 1 when it is valid' do
    ExpenseCategory.create name: 'Utilities'
    User.create username: 'test', password: '123', password_confirmation: '123'
    post '/measurement/create', params: {
      ex_cat_id: 1,
      date: '2020-08-02',
      user_id: 1,
      value: 203.50
    }
    response_obj = JSON.parse(response.body)
    expect(response_obj['code']).to eq(1)
  end
  it 'should create a measurement object in the database' do
    ExpenseCategory.create name: 'Utilities'
    User.create username: 'test', password: '123', password_confirmation: '123'
    post '/measurement/create', params: {
      ex_cat_id: 1,
      date: '2020-08-02',
      user_id: 1,
      value: 203.50
    }
    expect(Measurement.all.length).to be > 0
  end

  context 'get progress' do
    it 'should return all measurements based on user id parameter' do
      usr = User.create username: 'test', password: '123', password_confirmation: '123'
      ExpenseCategory.create name: 'Utilities'

      get "/progress/#{usr.id}"

      measures = Measurement.where(user_id: usr.id)
      response_obj = JSON.parse(response.body)
      expect(response_obj).to eql(measures.to_a)
    end
  end
end

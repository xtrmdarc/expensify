require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be invalid if no password is provided' do
    user = User.new username: 'admin'
    expect(user.valid?).to eq(false)
  end

  it 'should be invalid if username has already been taken' do
    User.create username: 'admin', password: '123', password_confirmation: '123'
    user = User.new username: 'admin', password: '1232', password_confirmation: '1232'
    expect(user.valid?).to eq(false)
  end

  it 'should be valid ' do
    user = User.new username: 'test', password: '123', password_confirmation: '123'
    user.save!
    expect(user.valid?).to eq(true)
  end
end

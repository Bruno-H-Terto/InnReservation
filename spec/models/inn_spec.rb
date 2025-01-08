require 'rails_helper'

describe 'Inn', type: :model do
  context '.all' do
    it 'should return all inns' do
      body = File.read(Rails.root.join('spec/support/json/inns.json'))
      response = double('response', body: body, status: 200)
      allow(Faraday).to receive(:get).and_return(response)
      
      inns = Inn.all

      expect(inns.length).to eq 2
    end

    it 'should return empty if connection failed' do
      body = File.read(Rails.root.join('spec/support/json/inns.json'))
      response = double('response', body: body, status: 200)
      allow(Faraday).to receive(:get).and_raise(Faraday::ConnectionFailed)
      
      inns = Inn.all

      expect(inns.length).to eq 0
    end

    it 'should return an exception when internal error' do
      body = File.read(Rails.root.join('spec/support/json/inns.json'))
      response = double('response', body: body, status: 200)
      allow(Faraday).to receive(:get).and_raise(ActiveModel::Errors)
      
      inns = Inn.all

      expect(inns.length).to eq 0
    end
  end
end
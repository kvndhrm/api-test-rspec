# frozen_string_literal: true

require 'base_rest'

RSpec.describe 'Create User', :new_user do
  let(:request) { HttpRequest.new(site: 'https://gorest.co.in/public/v1/') }
  let(:request_body) { JSON.parse(File.read('config/payload/user.json')) }
  $email = Faker::Internet.free_email

  context 'for REST API - POST /users' do
    it 'Create New User' do
      request_body['email'] = $email
      create_user = request.post(endpoint: 'users', body: request_body)
      expect(create_user.status).to eq 201
      expect(create_user.body['data']['status']).to eq 'active'
      expect(create_user.headers['content-type']).to eq 'application/json; charset=utf-8'
      expect(create_user.headers['connection']).to eq 'keep-alive'
      expect(create_user.headers['server']).to eq 'cloudflare'
      $id = create_user.body['data']['id']
    end
  end

  context 'for REST API - GET /users' do
    it 'Get User Existing' do
      get_user = request.get(endpoint: "users/#{$id}")
      expect(get_user.status).to eq 200
      expect(get_user.body['data']['email']).to eq $email
      expect(get_user.headers['content-type']).to eq 'application/json; charset=utf-8'
      expect(get_user.headers['connection']).to eq 'keep-alive'
      expect(get_user.headers['server']).to eq 'cloudflare'
    end
  end
end

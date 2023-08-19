# frozen_string_literal: true

class HttpRequest
  attr_accessor :site, :headers, :params, :body, :response, :endpoint

  def initialize(**args)
    @site = args[:site]
  end

  def base_headers
    @base_headers ||= {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json',
      'Authorization' => "Bearer #{ENV['AUTH_TOKEN']}"
    }
  end

  def connection
    Faraday.new(
      url: @site,
      headers: base_headers.to_h
    ) do |f|
      f.request :json
      f.request :retry
      f.response :json
      f.adapter :net_http
    end
  end

  def post(**args)
    connection.post(args[:endpoint], args[:body], args[:headers])
  end

  def put(**args)
    connection.post(args[:endpoint], args[:body], args[:headers])
  end

  def get(**args)
    connection.get(args[:endpoint], args[:params], args[:headers])
  end
end

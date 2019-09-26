# frozen_string_literal: true

class SocialNetworkResponse
  def self.call(url)
    new(url).call
  end

  def initialize(url)
    @url = url
  end

  def call
    call_social_network
    handle_response
  end

  private

  attr_reader :url, :response

  def call_social_network
    @response = Faraday.get(url)
  end

  def handle_response
    JSON.parse(response.body)
  rescue JSON::ParserError
    nil
  end
end

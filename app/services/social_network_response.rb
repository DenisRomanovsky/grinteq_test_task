# frozen_string_literal: true

class SocialNetworkResponse
  def self.call(url)
    new(url).call
  end

  def initialize(url)
    @url = url
  end

  def call; end

  private

  attr_reader :url
end

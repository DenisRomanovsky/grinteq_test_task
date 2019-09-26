# frozen_string_literal: true

class SocialNetworksMonitor
  SOCIAL_NETWORKS = [
    { name: :twitter, url: 'https://takehome.io/twitter' },
    { name: :facebook, url: 'https://takehome.io/facebook' },
    { name: :instagram, url: 'https://takehome.io/instagram' }
  ].freeze

  CACHE_TTL = 5.second.freeze
  CACHE_RACE_CONDITION_TTL = 8

  def self.call
    new.call
  end

  def call
    SOCIAL_NETWORKS.each_with_object({}) do |sn, memo|
      sn_name = sn[:name]
      memo[sn_name] = Rails.cache.fetch(sn_name, race_condition_ttl: CACHE_RACE_CONDITION_TTL, skip_nil: true) do
        SocialNetworkResponse.call(sn[:url])
      end
    end
  end
end

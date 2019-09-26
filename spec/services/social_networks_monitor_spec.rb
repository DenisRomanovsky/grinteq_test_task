# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SocialNetworksMonitor do
  subject { described_class.call }

  let(:social_network_response) { { test_key: 'test value' } }
  let(:social_networks_data) do
    { facebook: social_network_response,
      twitter: social_network_response,
      instagram: social_network_response }
  end

  describe '#call' do
    it 'calls social networks' do
      expect(SocialNetworkResponse).to receive(:call).exactly(SocialNetworksMonitor::SOCIAL_NETWORKS.size).times
                                                     .and_return(social_network_response)
      expect(subject).to eq(social_networks_data)
    end

    context 'when the network is down' do
      let(:social_network_response) { nil }
      let(:social_networks_data) do
        { facebook: nil,
          twitter: nil,
          instagram: nil }
      end

      it 'calls social networks' do
        expect(subject).to eq(social_networks_data)
      end
    end
  end
end

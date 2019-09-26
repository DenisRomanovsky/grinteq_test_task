# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SocialNetworkResponse do
  subject { described_class.call(url) }

  let(:url) { 'fake_url' }
  let(:expected_response) { { 'test' => 'value' } }
  let(:response_double) { double('faraday_response', body: expected_response.to_json) }

  before { expect(Faraday).to receive(:get).with(url).and_return(response_double) }

  describe '#call' do
    it 'returns parsed json' do
      expect(subject).to eq(expected_response)
    end

    context 'when network is down' do
      let(:expected_response) { nil }

      it 'returns nil' do
        expect(subject).to eq(nil)
      end
    end
  end
end

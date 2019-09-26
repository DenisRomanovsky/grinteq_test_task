# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SocialNetworksMonitorController, type: :controller do
  describe 'GET #show' do
    let(:sn_data) { { 'twitter' => [{ 'title' => 'test' }, { 'body' => 'test' }] } }
    before do
      allow(SocialNetworksMonitor).to receive(:call).and_return(sn_data)
    end

    it 'responds to html request' do
      get :show, format: 'html'
      expect(response).to have_http_status(:success)
    end

    it 'responds to json request' do
      get :show, format: 'json'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['response']).to eq(sn_data)
    end
  end
end

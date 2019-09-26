# frozen_string_literal: true

class SocialNetworksMonitorController < ApplicationController
  def show
    @sn_data = SocialNetworksMonitor.call

    respond_to do |format|
      format.json { render json: { status: 200, response: @sn_data } }
      format.html {}
    end
  end
end

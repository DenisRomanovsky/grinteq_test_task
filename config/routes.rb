# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'social_networks_monitor#show', as: 'sn_monitor'
end

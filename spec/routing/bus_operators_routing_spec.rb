require 'rails_helper'

RSpec.describe BusOperatorsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/bus_operators').to route_to('bus_operators#index')
    end

    it 'routes to #show' do
      expect(get: '/bus_operators/1').to route_to('bus_operators#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/bus_operators/1/edit').to route_to('bus_operators#edit', id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/bus_operators/1').to route_to('bus_operators#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/bus_operators/1').to route_to('bus_operators#update', id: '1')
    end
  end
end

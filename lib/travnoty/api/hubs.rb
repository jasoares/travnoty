require 'travnoty/api/utils'
require 'travnoty/hub'
require 'travnoty/server'

module Travnoty
  module API
    module Hubs
      include Travnoty::API::Utils

      def hubs(options={})
        objects_from_response(Travnoty::Hub, :get, "/hubs", options)
      end

      def hub(id, options={})
        object_from_response(Travnoty::Hub, :get, "/hubs/#{id}", options)
      end

      def hubs_servers(id, options={})
        objects_from_response(Travnoty::Server, :get, "hubs/#{id}/servers", options)
      end

    end
  end
end

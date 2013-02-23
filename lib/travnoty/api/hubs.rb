require 'travnoty/api/utils'
require 'travnoty/hub'

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

    end
  end
end

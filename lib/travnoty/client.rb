require 'faraday'
require 'multi_json'
require 'travnoty/api/hubs'
require 'travnoty/configurable'

module Travnoty
  class Client
    include Travnoty::API::Hubs
    include Travnoty::Configurable

    def initialize(options={})
      Travnoty::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Travnoty.instance_variable_get(:"@#{key}"))
      end
    end

    def get(path, params={})
      request(:get, path, params)
    end

    def post(path, params={})
      request(:post, path, params)
    end

  private

    def request(method, path, params={})
      response = connection.send(method.to_sym, path, params)
      response.env
    rescue MultiJson::DecodeError
      raise Travnoty::Error::DecodeError
    end

    def connection
      options = @connection_options.merge(:builder => @middleware)
      @connection ||= Faraday.new(@endpoint, options)
    end

  end
end

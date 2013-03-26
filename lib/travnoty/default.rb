require 'faraday'
require 'faraday-http-cache'
require 'travnoty/response/parse_json'
require 'travnoty/identity_map'
require 'logger'

module Travnoty
  module Default

    ENDPOINT = 'http://api.travnoty.com' unless defined? Twitter::Default::ENDPOINT

    CONNECTION_OPTIONS = {
      :headers => {
        :accept          => "application/vnd.travnoty.v1+json," \
                            "application/json;q=0.1",

        :accept_charset  => "utf-8",

        :user_agent      => "Travnoty Client #{Travnoty::Version}",
        :content_type    => "application/json"
      },
      :request => {
        :open_timeout => 5,
        :timeout => 10,
      },
      :ssl => {
        :verify => false
      },
    } unless defined? Travnoty::Default::CONNECTION_OPTIONS

    IDENTITY_MAP = false unless defined? Travnoty::Default::IDENTITY_MAP

    MIDDLEWARE = Faraday::Builder.new do |builder|
      builder.use Travnoty::Response::ParseJson
      builder.use :http_cache, :file_store, 'data/cache'
      builder.adapter Faraday.default_adapter
    end unless defined? Travnoty::Default::MIDDLEWARE

    class << self

      def options
        Hash[Travnoty::Configurable.keys.map { |key| [key, send(key)] }]
      end

      def endpoint
        ENDPOINT
      end

      def connection_options
        CONNECTION_OPTIONS
      end

      def identity_map
        IDENTITY_MAP
      end

      def middleware
        MIDDLEWARE
      end

    end
  end
end

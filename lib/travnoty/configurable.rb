require 'forwardable'
require 'travnoty/default'

module Travnoty
  module Configurable
    extend Forwardable
    attr_accessor :endpoint, :connection_options, :middleware
    def_delegator :options, :hash

    class << self

      def keys
        @keys ||= [
          :endpoint,
          :connection_options,
          :middleware,
        ]
      end

    end

    def reset!
      Travnoty::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Travnoty::Default.options[key])
      end
      self
    end
    alias setup reset!

  private

    def options
      Hash[Travnoty::Configurable.keys.map { |key| [key, instance_variable_get(:"@#{key}")] }]
    end

  end
end

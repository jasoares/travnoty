require 'travnoty/base'
require 'travnoty/error/identity_map_key_error'

module Travnoty
  class Identity < Travnoty::Base

    def self.fetch(attrs)
      return unless identity_map

      id = attrs[:id]
      if id && object = identity_map.fetch(id)
        return object.update(attrs)
      end

      return yield if block_given?
      raise Travnoty::Error::IdentityMapKeyError, "key not found"
    end

    def self.store(object)
      return object unless identity_map
      identity_map.store(object.id, object)
    end

    def initialize(attrs={})
      super
      raise ArgumentError, "argument must have an :id key" unless id
    end

    def ==(other)
      super || attr_equal(:id, other) || attrs_equal(other)
    end

    def id
      @attrs[:id]
    end

  end
end

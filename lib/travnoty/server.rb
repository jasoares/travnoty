module Travnoty
  class Server

    attr_reader :code, :host, :name, :speed, :world_id, :hub_id

    def initialize(code, host, name, speed, world_id, hub_id)
      @code, @host, @name, @speed = code, host, name, speed
      @world_id, @hub_id = world_id, hub_id
    end

    class << self

      ATTRIBUTES = [:code, :host, :name, :speed, :world_id, :hub_id]

      def attributes
        ATTRIBUTES
      end

      def build(attrs={})
        new(*attributes.map { |key| attrs[key] })
      end

    end

  end
end

module Travnoty
  class Hub

    attr_reader :id, :code, :host, :name, :language

    def initialize(id, code, host, name, language)
      @id, @code, @host, @name, @language = id, code, host, name, language
    end

    class << self

      ATTRIBUTES = [:id, :code, :host, :name, :language]

      def attributes
        ATTRIBUTES
      end

      def build(attrs={})
        new(*attributes.map { |key| attrs[key] })
      end

    end

  end
end

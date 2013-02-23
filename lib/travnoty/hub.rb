module Travnoty
  class Hub

    attr_reader :code, :host, :name, :language

    def initialize(code, host, name, language)
      @code, @host, @name, @language = code, host, name, language
    end

    class << self

      ATTRIBUTES = [:code, :host, :name, :language]

      def attributes
        ATTRIBUTES
      end

      def build(attrs={})
        new(*attributes.map { |key| attrs[key] })
      end

    end

  end
end

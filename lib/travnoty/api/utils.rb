module Travnoty
  module API
    module Utils

      private

      # @param klass [Class]
      # @param method [String, Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Object]
      def object_from_response(klass, method, path, options={})
        response = send(method.to_sym, path, options)
        #klass.build(response)
      end

      # @param klass [Class]
      # @param method [String, Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Object]
      def objects_from_response(klass, method, path, options={})
        response = send(method.to_sym, path, options)
        #klass.build(response)
      end

    end
  end
end

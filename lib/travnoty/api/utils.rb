module Travnoty
  module API
    module Utils

      private

      # @param klass [Class]
      # @param method [String, Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Object]
      def object_from_response(klass, request_method, path, options={})
        response = send(request_method.to_sym, path, options)
        klass.from_response(response)
      end

      # @param klass [Class]
      # @param method [String, Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Object]
      def objects_from_response(klass, request_method, path, options={})
        response = send(request_method.to_sym, path, options)[:body]
        objects_from_array(klass, response)
      end

      # @param klass [Class]
      # @param array [Array]
      # @return [Array]
      def objects_from_array(klass, array)
        array.map do |element|
          klass.fetch_or_new(element)
        end
      end

    end
  end
end

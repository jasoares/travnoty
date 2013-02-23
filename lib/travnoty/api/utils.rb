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
        klass.build(response[:body])
      end

      # @param klass [Class]
      # @param method [String, Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Object]
      def objects_from_response(klass, method, path, options={})
        response = send(method.to_sym, path, options)
        objects_from_array(klass, response[:body])
      end

      # @param klass [Class]
      # @param array [Array]
      # @return [Array]
      def objects_from_array(klass, array)
        array.map do |element|
          klass.build(element)
        end
      end

    end
  end
end

module Travnoty
  class Base

    def self.attr_reader(*attrs)
      mod = Module.new do
        attrs.each do |attribute|
          define_method attribute do
            @attrs[attribute.to_sym]
          end

          define_method "#{attribute}?" do
            !!@attrs[attribute.to_sym]
          end
        end
      end
      const_set(:ATTRIBUTES, mod)
      include mod
    end

    def self.identity_map
      return unless Travnoty.identity_map
      @identity_map = Travnoty.identity_map.new unless defined?(@identity_map) && @identity_map.class == Travnoty.identity_map
      @identity_map
    end

    def self.fetch(attrs)
      return unless identity_map
      if object = identity_map.fetch(Marshal.dump(attrs))
        return object
      end

      return yield if block_given?
      raise Travnoty::Error::IdentityMapKeyError, "key not found"
    end

    def self.store(object)
      return object unless identity_map
      identity_map.store(Marshal.dump(object.attrs), object)
    end

    def self.from_response(response={})
      fetch_or_new(response[:body])
    end

    def self.fetch_or_new(attrs={})
      return unless attrs
      return new(attrs) unless identity_map

      fetch(attrs) do
        object = new(attrs)
        store(object)
      end
    end

    def initialize(attrs={})
      @attrs = attrs
    end

    def [](method)
      send(method.to_sym)
    rescue NoMethodError
      nil
    end

    def attrs
      @attrs
    end

    alias to_hash attrs

    def update(attrs)
      @attrs.update(attrs)
      self
    end

  protected

    def attr_equal(attr, other)
      self.class == other.class && !other.send(attr).nil? && send(attr) == other.send(attr)
    end

    def attrs_equal(other)
      self.class == other.class && !other.attrs.empty? && attrs == other.attrs
    end

  end
end

module Travnoty

  class IdentityMap < Hash

    def fetch(id)
      self[id]
    end

    def store(id, object)
      self[id] = object
    end

  end

end

require 'travnoty/error'

module Travnoty
  class Error
    # Raised when JSON parsing fails
    class DecodeError < Travnoty::Error
    end
  end
end

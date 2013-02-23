module Travnoty
  class Version
    MAJOR = 0 unless defined? Twitter::Version::MAJOR
    MINOR = 0 unless defined? Twitter::Version::MINOR
    PATCH = 1 unless defined? Twitter::Version::PATCH

    class << self

      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH].compact.join('.')
      end

    end

  end
end

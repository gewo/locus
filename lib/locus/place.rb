module Locus
  class Place
    attr_accessor :country, :postal_code, :state_code

    def initialize(attributes = {})
      attributes.each do |key, value|
        public_send("#{key}=", value)
      end
    end

    # Find a place by postal code and country.
    #
    # @param postal_code [String] The postal code.
    # @param country [Symbol] Country symbol.
    #
    # @example
    #   Locus::Place.find_by_postal_code '12053', :de  # => 'BE'
    #
    # @return [Place] The {Place} or nil.
    def self.find_by_postal_code(postal_code, country = Locus.default_country)
      return nil unless state_code = state_code(postal_code, country)
      self.new(country: country,
               postal_code: postal_code,
               state_code: state_code)
    end

    private

      # Get the state code for a given postal code and country.
      #
      # @return [String] The state code or nil.
      def self.state_code(postal_code, country)
        return nil unless country = places[country]
        data = country[postal_code]
        if data
          data[:state_code]
        end
      end

      def self.places
        @places ||= YAML.load_file Locus.zip_path
      end
  end
end

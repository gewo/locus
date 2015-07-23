module Locus
  class Place
    attr_accessor :country, :postal_code, :state_code, :state_name

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
      return nil unless data = data(postal_code, country)
      new(
        country: country,
        postal_code: postal_code,
        state_code: data[:state_code],
        state_name: data[:state_name]
      )
    end

    private

      # Get the place data for a given postal code and country.
      #
      # @return [Hash] place data or nil. Same format as in yaml file.
      def self.data(postal_code, country)
        return nil unless country = places[country]
        country[postal_code]
      end

      def self.places
        @places ||= YAML.load_file Locus.zip_path
      end
  end
end

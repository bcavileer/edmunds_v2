require 'edmunds/vehicle'
require 'edmunds/api'

module Edmunds
  module Vehicle
    module Specification
      module ModelYear

        # Get model year details, including styles and trims, for a specific car make/model.
        #
        # @param [String] make The car makeNiceName
        # @param [String] model The car modelNiceName
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def list_of_years(make, model, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/#{make}/#{model}/years") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                submodel: Edmunds::Vehicle::SUBMODEL_REGEX,
                category: Edmunds::Vehicle::VEHICLE_CATEGORIES,
                state: %w[new used future],
                year: ((1990.to_s)..(Date.current.year.to_s)),
                view: %w[basic full],
                fmt:  %w[json]
            }

            request.default_parameters = { view: 'basic', fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end

        # Get the style details for a specific car make/mode/year.
        #
        # @param [String] make The car makeNiceName
        # @param [String] model The car modelNiceName
        # @param [String] year The car year (1990 - current year)
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def year_details(make, model, year, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/#{make}/#{model}/#{year}") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                submodel: Edmunds::Vehicle::SUBMODEL_REGEX,
                category: Edmunds::Vehicle::VEHICLE_CATEGORIES,
                state: %w[new used future],
                year: ((1990.to_s)..(Date.current.year.to_s)),
                view: %w[basic full],
                fmt:  %w[json]
            }

            request.default_parameters = { view: 'basic', fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end

        # Get the total number of model years for a car make/model.
        #
        # @param [String] make The car makeNiceName
        # @param [String] model The car modelNiceName
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def years_count(make, model, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/#{make}/#{model}/years/count") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                submodel: Edmunds::Vehicle::SUBMODEL_REGEX,
                category: Edmunds::Vehicle::VEHICLE_CATEGORIES,
                state: %w[new used future],
                year: ((1990.to_s)..(Date.current.year.to_s)),
                view: %w[basic full],
                fmt:  %w[json]
            }

            request.default_parameters = { view: 'basic', fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block || ->(edmunds_hash) do
              edmunds_hash[:yearsCount]
            end
          end
        end
      end
    end
  end
end

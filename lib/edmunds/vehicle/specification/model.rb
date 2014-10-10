require 'edmunds/vehicle'
require 'edmunds/api'

module Edmunds
  module Vehicle
    module Specification
      module Model

        # Get the list of car models for a specific car make.
        #
        # @param [String] make The car makeNiceName
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def list_of_models(make, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/#{make}/models") do |request|
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

        # Get the list of model year details and styles belonging to a specific car make and model.
        #
        # @param [String] make The car makeNiceName
        # @param [String] model The car modelNiceName
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def model_details(make, model, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/#{make}/#{model}") do |request|
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

        # Get the total number of models available for a specific car make.
        #
        # @param [String] make The car makeNiceName
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def models_count(make, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/#{make}/models/count") do |request|
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
              edmunds_hash[:modelsCount]
            end
          end
        end
      end
    end
  end
end

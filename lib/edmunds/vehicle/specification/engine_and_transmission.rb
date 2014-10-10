require 'edmunds/vehicle'
require 'edmunds/api'

module Edmunds
  module Vehicle
    module Specification
      module EngineAndTransmission

        # Get transmission details by ID
        #
        # @param [String] id The Transmission ID
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def transmission_id(id, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/transmissions/#{id}") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                fmt: %w[json]
            }

            request.default_parameters = { fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end

        # Get the vehicle transmissions for a particular vehicle style. This will return all available transmissions and their details.
        #
        # @param [String] style_id The vehicle style ID
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def transmissions_by_style(style_id, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/styles/#{style_id}/transmissions") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                name: :anything,
                availability: %w[optional standard],
                fmt: %w[json]
            }

            request.default_parameters = { fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end

        # Get engine details by ID
        #
        # @param [String] id The Engine ID
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def engine_id(id, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/engines/#{id}") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                fmt: %w[json]
            }

            request.default_parameters = { fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end

        # Get the vehicle engines for a particular vehicle style. This will return all available engines and their details.
        #
        # @param [String] style_id The vehicle style ID
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def engines_by_style(style_id, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/styles/#{style_id}/engines") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                name: :anything,
                availability: %w[optional standard],
                fmt: %w[json]
            }

            request.default_parameters = { fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end
      end
    end
  end
end

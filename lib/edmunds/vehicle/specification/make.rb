require 'edmunds/vehicle'
require 'edmunds/api'

module Edmunds
  module Vehicle
    module Specification
      module Make

        # Get the list of car makes.
        #
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def list_of_makes(raw_parameters={}, &block)
          Edmunds::Api.get('/api/vehicle/v2/makes') do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                state: %w[new used future],
                year:  ((1990.to_s)..(Date.current.year.to_s)),
                view:  %w[basic full],
                fmt: %w[json]
            }

            request.default_parameters = { view: 'basic', fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end

        # Get the list of models and model/year IDs belonging to a specific car make.
        #
        # @param [String] make The car makeNiceName
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def make_details(make, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/#{make}") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                state: %w[new used future],
                year: ((1990.to_s)..(Date.current.year.to_s)),
                view: %w[basic full],
                fmt: %w[json]
            }

            request.default_parameters = { view: 'basic', fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end

        # Get the total number of car makes.
        #
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def makes_count(raw_parameters={}, &block)
          Edmunds::Api.get('/api/vehicle/v2/makes/count') do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                state: %w[new used future],
                year: ((1990.to_s)..(Date.current.year.to_s)),
                view: %w[basic full],
                fmt: %w[json]
            }

            request.default_parameters = { view: 'basic', fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block || ->(edmunds_hash) do
              edmunds_hash[:makesCount]
            end
          end
        end
      end
    end
  end
end

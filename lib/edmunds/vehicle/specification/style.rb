require 'edmunds/vehicle'
require 'edmunds/api'

module Edmunds
  module Vehicle
    module Specification
      module Style
        # TODO Implement Style API

        # Get the vehicle style details (i.e. colors, options, transmission, engine, squishVins, …etc)
        # by the vehicle’s style ID. The style ID of a vehicle is available in the responses
        # of the model and model year endpoints.
        #
        # @param [String] id The style ID
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def by_id(id, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/styles/#{id}") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                view: %w[basic full],
                fmt:  %w[json]
            }

            request.default_parameters = { view: 'basic', fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end

        # Get the vehicle style details (i.e. colors, options, transmission, engine, squishVins, …etc)
        # by the vehicle’s Make/Mode/Year information. The style ID of a vehicle is available
        # in the responses of the model and model year endpoints.
        #
        # @param [String] make The car makeNiceName
        # @param [String] model The car modelNiceName
        # @param [String] year The car year (1990 - current year)
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def by_make_model_year(make, model, year, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/#{make}/#{model}/#{year}/styles") do |request|
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

        # Get the vehicle style details (i.e. colors, options, transmission, engine, squishVins, …etc)
        # by the vehicle’s Chrome Data ID. This endpoint is helpful for developers already using the
        # Chrome Data service and would like to leverage that to get access to the Edmunds style data.
        #
        # @param [String] chrome_id The Chrome Data ID
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def chrome(chrome_id, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/partners/chrome/styles/#{chrome_id}") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                fmt:  %w[json]
            }

            request.default_parameters = { fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end

        # Get the vehicle style count.
        #
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def count(raw_parameters={}, &block)
          Edmunds::Api.get('/api/vehicle/v2/styles/count') do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                state: %w[new used future],
                fmt:  %w[json]
            }

            request.default_parameters = { fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end

        # Get the vehicle style count by the vehicle’s Make information.
        #
        # @param [String] make The car makeNiceName
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def count_by_make(make, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/#{make}/styles/count") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                state: %w[new used future],
                fmt:  %w[json]
            }

            request.default_parameters = { fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end

        # Get the vehicle style count by the vehicle’s Make and Model information.
        #
        # @param [String] make The car makeNiceName
        # @param [String] model The car modelNiceName
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def count_by_make_model(make, model, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/#{make}/#{model}/styles/count") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                state: %w[new used future],
                fmt:  %w[json]
            }

            request.default_parameters = { fmt: 'json' }

            request.required_parameters = %w[fmt]

            request.result_function = block
          end
        end

        # Get the vehicle style count by the vehicle’s Make/Mode/Year information.
        #
        # @param [String] make The car makeNiceName
        # @param [String] model The car modelNiceName
        # @param [String] year The car year (1990 - current year)
        # @param [Hash] raw_parameters query parameters
        # @return [Edmunds::Api::ResponseProxy] response proxy object
        #
        def count_by_make_model_year(make, model, year, raw_parameters={}, &block)
          Edmunds::Api.get("/api/vehicle/v2/#{make}/#{model}/#{year}/styles/count") do |request|
            request.raw_parameters = raw_parameters

            request.allowed_parameters = {
                state: %w[new used future],
                fmt:  %w[json]
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

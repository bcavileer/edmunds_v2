require 'edmunds/api/request'
require 'edmunds/api/response_proxy'
require 'rest_client'
require 'multi_json'

module Edmunds
  module Api
    def self.get(path)
      request = Request.new(path)
      yield request
      ResponseProxy.new(request)
    end

    def self.base_uri
      'https://api.edmunds.com'
    end

    private

    def self.get_json(request)
      ::RestClient.get request.endpoint, params: request.parameters
    end

    def self.get_hash(json)
      ::MultiJson.load json
    end
  end
end

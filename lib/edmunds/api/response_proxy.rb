module Edmunds
  module Api
    class ResponseProxy
      instance_methods.each do |m|
        undef_method(m) unless m =~ /(^__|^nil\?|^send$|^object_id$)/
      end

      def initialize(request)
        @request = request
      end

      def respond_to?(symbol, include_private=false)
        if [:edmunds_request, :edmunds_json, :edmunds_hash].include? symbol
          true
        else
          result_function_result.respond_to?(symbol, include_private)
        end
      end

      def edmunds_request
        @request
      end

      def edmunds_json
        @edmunds_json ||= Edmunds::Api.get_json(@request)
      end

      def edmunds_hash
        @edmunds_hash ||= Edmunds::Api.get_hash(edmunds_json).with_indifferent_access
      end

      private

      def method_missing(method, *args, &block)
        result_function_result.send(method, *args, &block)
      end

      def result_function_result
        @result_function_result ||=
            @request.result_function ?
                @request.result_function.call(edmunds_hash) :
                edmunds_hash
      end
    end
  end
end

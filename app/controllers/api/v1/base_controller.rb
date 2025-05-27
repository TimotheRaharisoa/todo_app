module Api
  module V1
    class BaseController < ApplicationController
      # Add any API-specific controller configuration here

      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      private

      def pagination_meta(paginated_object)
        {
          current_page: paginated_object.current_page,
          next_page: paginated_object.next_page,
          prev_page: paginated_object.prev_page,
          total_pages: paginated_object.total_pages,
          total_count: paginated_object.total_count
        }
      end

      def success_response(data, status = :ok)
        render json: data, status: status
      end

      def error_response(message, status = :unprocessable_entity)
        render json: { error: message }, status: status
      end

      def not_found(exception)
        error_response(exception.message, :not_found)
      end

      def record_invalid(exception)
        error_response(exception.record.errors.full_messages, :unprocessable_entity)
      end

      def parameter_missing(exception)
        error_response(exception.message, :bad_request)
      end
    end
  end
end 
module Api
  class BaseController < ActionController::API
    before_action :current_store
    rescue_from ActionController::ParameterMissing, with: :error_during_processing
    rescue_from ArgumentError, with: :error_during_processing
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    protected

    def serialize_collection(collection)
      collection_serializer.new(
        collection
      ).serializable_hash
    end

    def serialize_resource(resource)
      resource_serializer.new(
        resource
      ).serializable_hash
    end

    def current_store
      @current_store ||= Store.find_by(url: request.domain) || Store.first
    end

    def render_serialized_payload(status = 200)
      render json: yield, status:, content_type:
    end

    def render_error_payload(error, status = 422)
      json = if error.is_a?(ActiveModel::Errors)
               { error: error.full_messages.to_sentence, errors: error.messages }
             elsif error.is_a?(Struct)
               { error: error.to_s, errors: error.to_h }
             else
               { error: }
             end

      render json:, status:, content_type:
    end

    def resource_serializer
      "Api::V1::#{model_class.to_s.demodulize}Serializer".constantize
    end

    def collection_serializer
      resource_serializer
    end

    def error_during_processing(exception)
      render_error_payload(exception, 400)
    end

    def record_not_found
      render_error_payload(I18n.t(:resource_not_found, scope: 'api'), 404)
    end
  end
end

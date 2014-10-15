module AngularFormValidation

  module Helpers

    module FormTag

      # Add form name attribute (id is added by default)
      def form_tag(url_for_options = {}, options = {}, &block)
        options.merge!({"name" => "#{controller.action_name}#{controller_name.classify}"})
        super(url_for_options = {}, options, &block)
      end

      def ng_model_opts(object, attribute)
        object_name = object.class.model_name.singular
        init_value = params[object_name.to_sym][attribute.to_s] if params[object_name.to_sym].present?
        opts  = {}
        opts["ng-model"] = "#{object_name}.#{attribute.to_s}"
        opts["ng-init"] = "#{object_name}.#{attribute.to_s}='#{init_value}'"
        opts
      end

      def ng_submit_opts(object)
        opts = {"ng-disabled" =>"#{controller.action_name}#{object.class.model_name}.$invalid"}
        opts
      end

    end

  end

end
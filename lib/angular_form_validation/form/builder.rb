module AngularFormValidation

  class FormBuilder < ActionView::Helpers::FormBuilder

    FIELD_HELPERS = %w{color_field date_field datetime_field datetime_local_field
      email_field month_field number_field password_field phone_field
      range_field search_field telephone_field text_area text_field time_field
      url_field week_field}

    FIELD_HELPERS.each do |method_name|
      define_method(method_name) do |method, options = {}|
        options.merge!({"ng-model" => "#{@object_name}.#{method.to_s}", "ng-init" => "#{@object_name}.#{method.to_s}='#{@object[method.to_s]}'"})
        super(method, options)
      end
    end

    def submit(value=nil, options={})
      options.merge!({"ng-disabled" =>"#{@template.action_name}#{@template.controller_name.classify}.$invalid"})
      super(value, options)
    end

    def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
      html_options.merge!({"ng-model" => "#{@object_name}.#{method.to_s}", "ng-init" => "#{@object_name}.#{method.to_s}='#{@object[method.to_s]}'"})
      super(method, collection, value_method, text_method, options, html_options)
    end

    def grouped_collection_select(method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
      html_options.merge!({"ng-model" => "#{@object_name}.#{method.to_s}", "ng-init" => "#{@object_name}.#{method.to_s}='#{@object[method.to_s]}'"})
      super(method, collection, group_method, group_label_method, option_key_method, option_value_method, options, html_options)
    end

    def time_zone_select(method, priority_zones = nil, options = {}, html_options = {})
      html_options.merge!({"ng-model" => "#{@object_name}.#{method.to_s}", "ng-init" => "#{@object_name}.#{method.to_s}='#{@object[method.to_s]}'"})
      super(method, priority_zones = nil, options, html_options)
    end

    def collection_check_boxes(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
      html_options.merge!({"ng-model" => "#{@object_name}.#{method.to_s}", "ng-init" => "#{@object_name}.#{method.to_s}='#{@object[method.to_s]}'"})
      super(method, collection, value_method, text_method, options = {}, html_options, &block)
    end

    def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
      html_options.merge!({"ng-model" => "#{@object_name}.#{method.to_s}", "ng-init" => "#{@object_name}.#{method.to_s}='#{@object[method.to_s]}'"})
      super(method, collection, value_method, text_method, options = {}, html_options, &block)
    end

  end

end
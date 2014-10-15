require 'rails'

module AngularFormValidation
  class Railtie < ::Rails::Railtie
    initializer "angular_form_validation.setup_view_helpers" do
      ActiveSupport.on_load(:action_view) do
        include ::AngularFormValidation::Helpers
      end
    end
  end
end
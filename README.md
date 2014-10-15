# AngularFormValidation

Implement easily angular validation via form_form and form_tag helpers

## Installation

gem 'angular_form_validation'

## What it does

- Implements Angular attributes on form inputs (ng-model, ng-init) and form buttons (ng-disabled) automatically when using the helper form_for
- Provides helpers methods to perform the same when using the helper form_tag

As a result, you can easily have JavaScript validation on all forms with a minimum effort, nice real-time visual feedback on form inputs and take advantage of two-way bindings.

## Usage for form_tag

When using the helper form_tag, it is required to use the following helpers:

### ng_model_opts(object, attribute)

This helper can be used on form inputs to add the ng-model and ng-init attributes:

Example: 

    <%= text_field_tag :name, params[:name], { required: true }.merge(ng_model_opts(@user, :name)
    
### ng_submit_opts(object)

This helper can be used on form buttons to add the ng-disabled attribute:

Example: 

    <%= button_tag t("common.form.actions.save_btn"), ng_submit_opts(@product_config) %

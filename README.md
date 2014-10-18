
# Angular Form Validation Gem 

Ruby gem to easily implement angular validation via Rails form helpers form_for and form_tag
 
[![Gem Version](https://badge.fury.io/rb/angular_form_validation.png)](http://badge.fury.io/rb/angular_form_validation)

## Installation

gem 'angular_form_validation'

## What it does

- Implements Angular attributes on form inputs (ng-model, ng-init) and form buttons (ng-disabled) automatically when using the helper form_for
- Provides helpers methods to perform the same when using the helper form_tag

As a result, you can easily have JavaScript validation on all forms with a minimum effort, nice real-time visual feedback on form inputs and take advantage of two-way bindings.

![Gem Demo](http://d1iix9iwi7lpon.cloudfront.net/images/gif/angular-form-gem-demo.gif)

## Usage for form_for helper

Write the standard form_for and specify which input is required for validation purposes:

    form_for @product_category do |f|
        label_tag :ref_code
        f.text_field :ref_code, required: true
        label_tag :name
        f.text_field :name, required: true
        f.submit "Create"
    end
    
This will generate the following form:

    <form accept-charset="UTF-8" action="/catalog/product-categories" class="ng-pristine ng-invalid ng-invalid-required" id="new_product_category" method="post" name="postProductCategory">
        <label for="ref_code">Ref code</label>
        <input id="product_category_ref_code" name="product_category[ref_code]" ng-init="product_category.ref_code=''" ng-model="product_category.ref_code" required="required" type="text" class="ng-pristine ng-invalid ng-invalid-required">        <label for="name">Name</label>
        <input id="product_category_name" name="product_category[name]" ng-init="product_category.name=''" ng-model="product_category.name" required="required" type="text" class="ng-pristine ng-invalid ng-invalid-required">
        <input name="commit" ng-disabled="postProductCategory.$invalid" type="submit" value="Create" disabled="disabled">
    </form>

## Usage for form_tag helper

When using the helper form_tag, it is required to use the following helpers:

### ng_model_opts(object, attribute)

This helper can be used on form inputs to add the ng-model and ng-init attributes:

Example: 

    <%= text_field_tag :name, params[:name], ng_model_opts(@user, :name, required: true) %>
    
### ng_submit_opts(object)

This helper can be used on form buttons to add the ng-disabled attribute:

Example: 

    <%= button_tag t("common.form.actions.save_btn"), ng_submit_opts(@product_config) %>
    
### Example

    form_tag product_category_path do |f|
        label_tag :ref_code
        text_field_tag :ref_code, params[:ref_code], ng_model_opts(@product_category, :ref_code, required: true)
        label_tag :name
        text_field_tag :name, params[:name], ng_model_opts(@product_category, :name, required: true)
        button_tag "Create", ng_submit_opts(@product_category)
    end
    
## SASS styling

This gem does not include css styles for Angular built-in form classes. 

Feel free to implement your own but you can use the styles below as a starting point when using some popular css frameworks.

### Bootstrap

    .ng-invalid.ng-dirty {
      border-color: $state-danger-border;
      &:hover {
        border-color: $state-danger-border;
      }
      &:focus {
        border-color: $state-danger-border;
        box-shadow: inset 0 1px 3px rgba(0,0,0,0.06), 0 0 5px rgba(darken($state-danger-border, 5), 0.7);
        outline: none;
      }
    }
    
    .ng-valid.ng-dirty {
      border-color: $state-success-border;
      &:hover {
        border-color: $state-success-border;
      }
      &:focus {
        border-color: $state-success-border;
        box-shadow: inset 0 1px 3px rgba(0,0,0,0.06), 0 0 5px rgba(darken($state-success-border, 5), 0.7);
        outline: none;
      }
    }

### Bourbon.io

    $form-ng-invalid-color: darken($error-color, 10);
    $form-ng-valid-color: darken($success-color, 30);
    
    .ng-invalid.ng-dirty {
      border-color: $form-ng-invalid-color;
      &:hover {
        border-color: $form-ng-invalid-color;
      }
      &:focus {
        border-color: $form-ng-invalid-color;
        box-shadow: inset 0 1px 3px rgba(0,0,0,0.06), 0 0 5px rgba(darken($form-ng-invalid-color, 5), 0.7);
        outline: none;
      }
    }
    
    .ng-valid.ng-dirty {
      border-color: $form-ng-valid-color;
      &:hover {
        border-color: $form-ng-valid-color;
      }
      &:focus {
        border-color: $form-ng-valid-color;
        box-shadow: inset 0 1px 3px rgba(0,0,0,0.06), 0 0 5px rgba(darken($form-ng-valid-color, 5), 0.7);
        outline: none;
      }
    }

Developed by [Nimbl3](http://www.nimbl3.com)
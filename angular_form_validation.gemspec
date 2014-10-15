# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'angular_form_validation/version'

Gem::Specification.new do |spec|
  spec.name          = "angular_form_validation"
  spec.version       = AngularFormValidation::VERSION
  spec.authors       = ["Olivier Robert", "Nimbl3"]
  spec.email         = ["olivier@nimbl3.com"]
  spec.summary       = "Implement easily angular validation via form_form and form_tag helpers"
  spec.description   = ""
  spec.homepage      = "https://github.com/nimbl3/angular-form-validation"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

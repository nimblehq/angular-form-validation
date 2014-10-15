require "angular_form_validation/version"

module AngularFormValidation

end

%w(form helpers).each do |lib|
  Dir.glob("#{File.dirname(__FILE__)}/form_angular/#{lib}/*").each { |file|
    require file
  }
end
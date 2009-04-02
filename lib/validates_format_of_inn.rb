require 'inn'

module ActiveRecord
  module Validations
    module ClassMethods
       def validates_format_of_inn(*attr_names)
        configuration = { :message => ActiveRecord::Errors.default_error_messages[:invalid],
                          :on => :save,
                          :with => nil }
          configuration.update(attr_names.extract_options!)
 
          validates_each(attr_names, configuration) do |record, attr_name, value|
            inn = INN.new(value)
 
            message = :message unless inn.format_good
            message = :message unless inn.valid?
 
            record.errors.add(attr_name, configuration[message]) if message
          end
       end
    end
  end
end

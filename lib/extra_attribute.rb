module ExtraAttribute
  module ClassMethods
    def extra_attributes(column, attribute_arrays)
      @extra_attributes_column = column.to_s

      class_eval %(
        class << self; attr_accessor :extra_attributes_column end
      )

      attribute_arrays.each do |attr|
        define_method "#{attr}" do
          extra_data ||= JSON.parse(attributes[self.class.extra_attributes_column] ? attributes[self.class.extra_attributes_column] : '{}')
          return extra_data[attr.to_s].present? ? extra_data[attr.to_s] : nil
        end

        define_method "#{attr}=" do |val|
          extra_data ||= JSON.parse(attributes[self.class.extra_attributes_column] ? attributes[self.class.extra_attributes_column] : '{}')
          extra_data[attr.to_s] = val
          self.send("#{self.class.extra_attributes_column}=", extra_data.to_json)
        end
      end
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

end

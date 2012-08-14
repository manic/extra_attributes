module ExtraAttribute
  module ClassMethods
    def extra_attributes(column, attribute_arrays)
      @@column = column.to_s
      attribute_arrays.each do |attr|
        define_method "#{attr}" do
          extra_data ||= JSON.parse(attributes[@@column] ? attributes[@@column] : '{}')
          return extra_data[attr.to_s].present? ? extra_data[attr.to_s] : nil
        end

        define_method "#{attr}=" do |val|
          extra_data ||= JSON.parse(attributes[@@column] ? attributes[@@column] : '{}')
          extra_data[attr.to_s] = val
          self.send("#{@@column}=", extra_data.to_json)
        end
      end
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

end

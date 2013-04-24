require 'active_record'
require 'extra_attribute'

class Man < ActiveRecord::Base
  include ExtraAttribute
  extra_attributes :properties, [:name]

  has_one :child
  accepts_nested_attributes_for :child
end


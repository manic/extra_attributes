require 'active_record'
require 'extra_attribute'

class Person < ActiveRecord::Base
  include ExtraAttribute
  extra_attributes :extra_attributes, [:name]

  has_one :child
  accepts_nested_attributes_for :child
end


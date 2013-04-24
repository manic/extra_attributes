require 'active_record'

ActiveRecord::Schema.define do
  create_table 'people', :force => true do |t|
    t.string   'age'
    t.text     'extra_attributes'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'men', :force => true do |t|
    t.string   'age'
    t.text     'properties'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'children', :force => true do |t|
    t.string   'name'
    t.belongs_to :person
  end
end

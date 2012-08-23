# extra\_attributes

by Manic <http://tech.manic.tw>

## LINKS:

* [github](https://github.com/manic/extra_attributes)

## INSTALLATION:

    gem install extra_attributes

## USAGE:

### Create the migration for your model

    create_table :people do |t|
      t.text  :extra_data # Name this column whatever you like just *make sure* it is a TEXT field
      ....
    end

### Configure extra\_attributes in you config/application.rb

    require File.expand_path('../boot', __FILE__)

    require 'rails/all'
    require 'extra_attribute' # Add this line to enable

### Configure extra\_attributes in your model

    class Person < ActiveRecord::Base
      include ExtraAttribute

      extra_attributes :extra_data, [:name, :nickname] # This sets up the column for your custom attributes
    end

### Set and Get custom attributes as if they were a normal attribute on your model

    person = Person.new
    person.name = 'Joe'
    person.nickname = 'Joey'
    person.name ~> 'Joe'
    person.nickname ~> 'Joey'

    person = Person.new :name => 'Joe'
    person.save!
    person.name ~> 'Joe'

## LICENSE:

Apache License 2.0

Copyright (c) 2012, PIXNET

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "extra_attributes"
  s.version     = ExtraAttribute::VERSION
  s.authors     = ["Manic"]
  s.email       = ["maniclf@gmail.com"]
  s.homepage    = %q{http://github.com/manic/extra_attributes}
  s.summary     = %q{A simple alternative to acts_as_eav_model.}
  s.description = %q{A simple alternative to acts_as_eav_model. Use JSON to store extra attrubutes.}

  s.files            = [".gitignore", ".rvmrc", "Gemfile", "Gemfile.lock", "LICENSE", "README.md", "Rakefile", "extra_attributes.gemspec", "lib/extra_attribute.rb", "lib/version.rb"]
  s.test_files       = ["spec/db/schema.rb", "spec/lib/extra_attribute_spec.rb", "spec/spec_helper.rb", "spec/support/child.rb", "spec/support/person.rb"]
  s.executables      = []
  s.extra_rdoc_files = [ "README.md" ]
  s.require_path     = "lib"

  s.add_dependency 'activerecord', '~> 3.1'
  unless ENV["CI"]
    if RUBY_VERSION <= '1.9.1'
      s.add_development_dependency 'ruby-debug'
    else
      s.add_development_dependency 'ruby-debug19'
    end
  end
  s.add_development_dependency 'sqlite3', '~> 1.3.3'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.6.0'
end

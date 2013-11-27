# -*- encoding: utf-8 -*-
require "./lib/star_it/version"

Gem::Specification.new do |s|
  s.name = "star_it"
  s.version = StarIt::VERSION
  s.date = '2013-11-20'
  s.summary     = %q{Gem to add required star_it for view fields}
  s.description = "A gem to add class mandatory to model required fields"
  s.authors = ["Deepthi"]
  s.email = "deepthirera@gmail.com"
  s.files = Dir['lib/**/*.rb']
  s.test_files = ['spec/label_form_builder_spec.rb', 'spec/spec_helper.rb', 'spec/star_required_fields_spec.rb', 'spec/db/schema.rb', 'spec/db/database.yml']
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "rails", "4.0.0"
  s.add_dependency('activemodel', '>= 4.0.0')
  s.add_dependency('actionpack', '>= 4.0.0')
end


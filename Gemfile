source ENV['GEM_SOURCE'] || "https://rubygems.org"

group :test do
  gem "rake", '< 11'
  gem "puppet", ENV['PUPPET_GEM_VERSION'] || '~> 4'
  gem "rspec"
  gem "rspec-puppet", :git => 'https://github.com/rodjek/rspec-puppet.git'
  gem "puppetlabs_spec_helper"
  gem "metadata-json-lint"
  gem "rspec-puppet-facts"
  gem 'rubocop', '0.33.0'
  gem 'simplecov', '>= 0.11.0'
  gem 'simplecov-console'
  gem "puppet-lint-absolute_classname-check"
  gem "puppet-lint-leading_zero-check"
  gem "puppet-lint-trailing_comma-check"
  gem "puppet-lint-version_comparison-check"
  gem "puppet-lint-classes_and_types_beginning_with_digits-check"
  gem "puppet-lint-unquoted_string-check"
  gem 'puppet-lint-resource_reference_syntax'
end

group :onceover do
  gem 'onceover'
  gem 'onceover-octocatalog-diff', :git => 'https://github.com/petems/onceover-octocatalog-diff', :branch => 'petems_fixes'
  gem 'rugged', '0.25.1.1'
  gem 'CFPropertyList'
end

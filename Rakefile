require 'rubygems'
require 'bundler/setup'

require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet/version'
require 'puppet/vendor/semantic/lib/semantic' unless Puppet.version.to_f < 3.6
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'
require 'rubocop/rake_task'

# onceover isn't always present
begin
  require 'onceover/rake_tasks'
rescue LoadError # rubocop:disable Lint/HandleExceptions
end

RuboCop::RakeTask.new

exclude_paths = [
  "bundle/**/*",
  "pkg/**/*",
  "vendor/**/*",
  "spec/**/*",
]

PuppetLint.configuration.relative = true
PuppetLint.configuration.disable_140chars
PuppetLint.configuration.disable_class_inherits_from_params_class
PuppetLint.configuration.disable_class_parameter_defaults
PuppetLint.configuration.fail_on_warnings = true

PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = exclude_paths
end

PuppetSyntax.exclude_paths = exclude_paths

class String
  REGEXP_PATTERN = /\033\[([0-9]+);([0-9]+);([0-9]+)m(.+?)\033\[0m|([^\033]+)/m
  LAST_ESCAPES = /(\[[0-9]+m)/m

  def uncolorize
    self.scan(REGEXP_PATTERN).inject("") do |str, match|
      str << (match[3] || match[4])
    end
  end

  def unansize
    self.gsub(LAST_ESCAPES,'')
  end
end

namespace :onceover do
  desc "›› Commit with message"
  task :catalog_diff, [:new_branch, :origin_branch] do |_t, args|
    new_branch    = args[:new_branch] || %x(git rev-parse --abbrev-ref HEAD).strip
    origin_branch = args[:origin_branch] || 'production'
    diff_command  = "bundle exec onceover run diff --from #{new_branch} --to #{origin_branch}"
    puts "Running #{diff_command}"
    output = %x(#{diff_command})
    github_markdown = <<-eos
```diff
#{output.uncolorize.unansize}
```
eos

    puts github_markdown
  end
end

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tty/platform/version'

Gem::Specification.new do |spec|
  spec.name          = "tty-platform"
  spec.version       = TTY::Platform::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["me@piotrmurach.com"]
  spec.summary       = %q{Query methods for detecting different operating systems and their properties.}
  spec.description   = %q{Query methods for detecting different operating systems and their properties.}
  spec.homepage      = "https://github.com/piotrmurach/tty-platform"
  spec.license       = "MIT"
  if spec.respond_to?(:metadata=)
    spec.metadata = {
      "allowed_push_host" => "https://rubygems.org",
      "bug_tracker_uri"   => "#{spec.homepage}/issues",
      "changelog_uri"     => "#{spec.homepage}/blob/master/CHANGELOG.md",
      "documentation_uri" => "https://www.rubydoc.info/gems/tty-platform",
      "homepage_uri"      => spec.homepage,
      "source_code_uri"   => spec.homepage
    }
  end
  spec.files         = Dir['{lib,spec}/**/*.rb']
  spec.files        += Dir['{bin,tasks}/*', 'tty-platform.gemspec']
  spec.files        += Dir['README.md', 'CHANGELOG.md', 'LICENSE.txt', 'Rakefile']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '>= 1.5'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'rake'
end

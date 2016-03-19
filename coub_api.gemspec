# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coub_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'coub_api'
  spec.version       = CoubApi::VERSION
  spec.authors       = ['Emil Shakirov']
  spec.email         = ['5o.smoker@gmail.com']

  spec.summary       = 'Ruby wrapper for coub.com API'
  spec.description   = 'Ruby wrapper for coub.com API'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'minitest-vcr', '~> 1.4.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'vcr', '~> 3.0.1'
  spec.add_development_dependency 'webmock', '~> 1.24.1'
  spec.add_development_dependency 'simplecov', '~> 0.11.2'

  spec.add_runtime_dependency 'her', '~> 0.8.1'
end

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bocu/version'

Gem::Specification.new do |spec|
  spec.name          = 'bocu'
  spec.version       = Bocu::VERSION
  spec.authors       = ['Emil Shakirov']
  spec.email         = ['me@emil.sh']

  spec.summary       = 'Ruby wrapper for coub.com API'
  spec.description   = 'Ruby wrapper for coub.com API'
  spec.homepage      = 'https://github.com/vaihtovirta/bocu'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'her', '~> 1'
end

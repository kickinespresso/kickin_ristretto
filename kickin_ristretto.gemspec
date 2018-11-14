
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kickin_ristretto/version"

Gem::Specification.new do |spec|
  spec.name          = "kickin_ristretto"
  spec.version       = KickinRistretto::VERSION
  spec.authors       = ["KickinEspresso"]
  spec.email         = ["chris@kickinespresso.com"]

  spec.summary       = %q{Check rails assets for legacy or used files}
  spec.description   = %q{Rake tasks that check a rails project for unused assets}
  spec.homepage      = "https://github.com/kickinespresso/kickin_ristretto"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency('prawn', '~> 2.2.2')
  spec.add_dependency('prawn-table', '~> 0.2.2')

end

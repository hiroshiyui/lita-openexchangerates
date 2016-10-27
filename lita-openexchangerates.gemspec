Gem::Specification.new do |spec|
  spec.name          = "lita-openexchangerates"
  spec.version       = "0.1.1"
  spec.authors       = ["Hiroshi Yui"]
  spec.email         = ["hiroshiyui@kkbox.com"]
  spec.description   = "Lita handler for Open Exchange Rates (https://openexchangerates.org/)"
  spec.summary       = "Lita handler for Open Exchange Rates (https://openexchangerates.org/)"
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.7"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end

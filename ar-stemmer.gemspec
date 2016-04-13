# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ar-stemmer"
  spec.version       = "0.4.1"
  spec.authors       = ["Tomoya Hirano"]
  spec.email         = ["hiranotomoya@gmail.com"]

  spec.summary       = "Ar-Stemmer is a Ruby port of Arabic Stemmer from Lucene with extensions."
  spec.description   = "Ar-Stemmer is a Ruby port of Arabic Stemmer from Lucene with extensions."
  spec.homepage      = "https://github.com/tomoya55/ar-stemmer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
end

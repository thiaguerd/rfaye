lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# require 'rfaye'
require 'rfaye/conf'

Gem::Specification.new do |s|
	s.name        = 'rfaye'
	s.version     = Rfaye::Conf.version
	s.date        = Time.now.strftime("%Y-%m-%d")
	s.summary     = "Rails Faye"
	s.description = "Simple messaging "
	s.authors     = ["Thiago Feitosa"]
	s.email       = "mail@thiago.pro"
	# s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
	s.files        =  Dir.glob("{bin,lib,app}/**/*") + %w(LICENSE README.md)
  	s.require_path = "lib"
	s.homepage    = "http://rubygems.org/gems/rfaye"
	s.license     = 'MIT'

	s.require_paths = ["lib"]

	s.add_runtime_dependency 'faye', '~> 1.1', '>= 1.1.2'
	s.add_runtime_dependency 'thin', '~> 1.6', '>= 1.6.4'
	s.add_runtime_dependency 'bcrypt', '~> 3.1', '>= 3.1.7'

end

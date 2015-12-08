Gem::Specification.new do |s|
	s.name        = 'rfaye'
	s.version     = '0.0.4'
	s.date        = '2015-09-21'
	s.summary     = "Rails Faye"
	s.description = "Simple messaging "
	s.authors     = ["Thiago Feitosa"]
	s.email       = "mail@thiago.pro"
	s.files       = ["lib/rfaye.rb","/vendor/assets/javascripts/rfaye.js","vendor/assets/stylesheets/rfaye.css"]
	s.homepage    = "http://rubygems.org/gems/hola"
	s.license     = 'MIT'

	s.add_runtime_dependency 'faye', '~> 1.1', '>= 1.1.2'
	s.add_runtime_dependency 'thin', '~> 1.6', '>= 1.6.4'

end

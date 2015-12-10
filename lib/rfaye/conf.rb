require 'yaml'

module Rfaye
	class Conf

		@@config = {}
		@@version = "0.5.2"
		@@secure_prefix = "s"

		def self.load(filename, environment)
			yaml = YAML.load_file(filename)[environment.to_s]
			raise ArgumentError, "The #{environment} environment does not exist in #{filename}" if yaml.nil?
			yaml.each { |k, v| @@config[k.to_sym] = v }
		end
		
		def self.config
			@@config 
		end
		
		def self.version
			@@version 
		end

		def self.secure_prefix
			@@secure_prefix
		end

		def self.secure_prefix= sc
			@@secure_prefix = sc
		end

		def self.[] x
			@@config[x]
		end
	end
end
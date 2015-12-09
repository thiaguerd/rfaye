
require "rfaye/faye_extension"
require "rfaye/engine" if defined? Rails
require "faye"

module Rfaye
	class << self
		def up(options = {})
			Rfaye::Conf.load(File.expand_path("../config/private_pub.yml", __FILE__), ENV["RAILS_ENV"] || "development")
			options = {:mount => "/faye", :timeout => 45, :extensions => [FayeExtension.new]}.merge(options)
			Faye::WebSocket.load_adapter('thin')
			Faye::RackAdapter.new(options)
		end
	end
end
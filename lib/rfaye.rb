require "faye" 
require "rfaye/faye_extension"
require "rfaye/engine"
require "rfaye/conf"

module Rfaye
	class << self
		def up(options = {})
			options = {:mount => Rfaye::Conf[:mount], :timeout => 45, :extensions => [FayeExtension.new]}.merge(options)
			Faye::WebSocket.load_adapter('thin')
			Faye::RackAdapter.new(options)
		end
	end
end
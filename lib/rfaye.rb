require "rfaye/version"
require "rfaye/faye_extension"

require "rfaye/engine" if defined? Rails

require "faye"

module Rfaye
	class << self
		def up(options = {})
			options = {:mount => "/faye", :timeout => 45, :extensions => [FayeExtension.new]}.merge(options)
			Faye::WebSocket.load_adapter('thin')
			Faye::RackAdapter.new(options)
		end
	end
end
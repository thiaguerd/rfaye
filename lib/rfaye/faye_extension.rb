module Rfaye
	class FayeExtension
		def incoming(message, callback)
			puts "message: #{message}"
			callback.call(message)
		end	
	end
end
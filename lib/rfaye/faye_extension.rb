module Rfaye
	class FayeExtension
		def incoming(message, callback)
			puts ""
			puts "incoming begin".center(150,"_")
			puts "secure prefix: #{Rfaye::Conf.secure_prefix}".center(150,"_")
			puts "message: #{message}"
			puts "incoming end".center(150,"_")
			puts ""
			callback.call(message)
		end	
	end
end
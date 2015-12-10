module Rfaye
	class FayeExtension
		def incoming(message, callback)
			if message["channel"].start_with?("/#{Rfaye::Conf[:secure_channel_prefix]}")
				puts "mensagem bloqueada #{message}"
				message["error"] = "channel private!"
			end
			callback.call(message)
		end	
	end
end
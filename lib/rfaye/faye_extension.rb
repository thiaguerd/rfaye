module Rfaye
	class FayeExtension
		def incoming(message, callback)
			begin
				p = Rfaye::Conf[:secure_channel_prefix].start_with?("/") ? Rfaye::Conf[:secure_channel_prefix] : "/" + Rfaye::Conf[:secure_channel_prefix]
				if message["channel"].start_with? p
					if !token_check(message)
						message["error"] = "channel private!"
						puts "BLOCK #{message}" if Rfaye::Conf[:debug]
					end
				else
					puts "OK #{message}" if Rfaye::Conf[:debug]
				end
				callback.call(message)
			rescue
				message = {}
				message["error"] = "request is not valid"
				callback.call(message)
			end
		end
		private
			def token_check message
				begin
					BCrypt::Password.new(message["token"]) == "#{message['data']}#{Rfaye::Conf[:token]}"
				rescue
					false
				end
			end	
	end
end
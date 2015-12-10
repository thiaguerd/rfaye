require 'rfaye/conf'
module Rfaye
	module ViewHelpers
		# def pub onde, oque
		# 	puts "pub begin".center(150,"_")
		# 	puts "Rfaye::Conf[:secure_channel_prefix]: #{Rfaye::Conf[:secure_channel_prefix]}".center(150,"_")
		# 	puts "pub #{oque} #{onde}"
		# 	puts "pub end".center(150,"_")
		# end
		def initialize
			Rfaye::Conf.load(File.expand_path("../config/rfaye.yml", __FILE__), ENV["RAILS_ENV"] || "development")
		end
		def sub onde, oque
			puts "sub begin".center(150,"_")
			puts "Rfaye::Conf[:secure_channel_prefix]: #{Rfaye::Conf[:secure_channel_prefix]}".center(150,"_")
			puts "sub #{oque} #{onde}"
			puts "sub end".center(150,"_")
		end

		def un_sub onde
			puts "unsub begin".center(150,"_")
			puts "Rfaye::Conf[:secure_channel_prefix]: #{Rfaye::Conf[:secure_channel_prefix]}".center(150,"_")
			puts "unsub #{oque}"
			puts "unsub end".center(150,"_")
		end

		def pub(channel, &block)
			message = {:channel => channel, :data => capture(&block), :token => Rfaye::Conf[:token]}  
			uri = URI.parse("http://#{Rfaye::Conf[:host]}:#{Rfaye::Conf[:port]}/#{Rfaye::Conf[:mount]}")  
			Net::HTTP.post_form(uri, :message => message.to_json)  
		end

	end
end
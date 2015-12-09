require 'rfaye'

# class ServerAuth
# 	@@v = {a: 1}
# 	def incoming(message, callback)
# 		puts message	
# 		if (message['channel'] !~ %r{^/meta/}) && (message['token'] != FAYE_TOKEN)
# 			message['error'] = 'Invalid authentication token.'
# 		end
# 		if message['channel'] == '/meta/subscribe' && message['subscription'] && message['token']
# 			a = Digest::SHA512.hexdigest("#{FAYE_TOKEN}#{message['subscription']}")
# 			if BCrypt::Password.new(message['token']) != Digest::SHA512.hexdigest("#{FAYE_TOKEN}#{message['subscription']}")
# 				message['error'] = 'Invalid authentication token.'
# 			end
# 		end
# 		callback.call message
# 	end
# end

# Rfaye.up
# app = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
# app.add_extension(ServerAuth.new)
run Rfaye.up()


=begin
	
# Run with: rackup private_pub.ru -s thin -E production
require "bundler/setup"
require "yaml"
require "faye"
require "private_pub"

Faye::WebSocket.load_adapter('thin')

PrivatePub.load_config(File.expand_path("../config/private_pub.yml", __FILE__), ENV["RAILS_ENV"] || "development")
run PrivatePub.faye_app

	
=end

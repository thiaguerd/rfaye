require 'rfaye/conf'
require 'bcrypt'

module Rfaye
	module ViewHelpers
		
		def sub channel, &block
			channel = "/#{channel}" if !channel.start_with?("/")
			content_tag "script", :type => "text/javascript" do
				if block
					raw %[Rfaye.sub("#{channel}",function(data){#{capture(&block)}})]
				else
					raw %[Rfaye.sub("#{channel}")]
				end
			end
		end

		def un_sub onde
			channel = "/#{channel}" if !channel.start_with?("/")
			content_tag "script", :type => "text/javascript" do
				raw %[Rfaye.un_sub("#{channel}")]
			end
		end

		def pub channel, &block
			Net::HTTP.post_form(uri, message: message(channel, &block))  
		end
		
		private
			def data &block
				b = capture(&block)
				l = YAML.load(b.to_s.gsub(/\n|\t/,'').strip)
				l.is_a?(Hash) ? l : b.to_s
			end

			def message channel, &block
				channel = "/#{channel}" if !channel.start_with?("/")
				m = {"channel" => channel, "data" => data(&block), "token" => Rfaye::Conf[:token]}
				t = token channel, data(&block)
				m["token"] = t if t
				m.to_json
			end

			def uri
				URI.parse("http://#{Rfaye::Conf[:host]}:#{Rfaye::Conf[:port]}#{Rfaye::Conf[:mount]}")
			end

			def token channel, data
				if channel.start_with? (Rfaye::Conf[:secure_channel_prefix].start_with?("/") ? Rfaye::Conf[:secure_channel_prefix] : "/" + Rfaye::Conf[:secure_channel_prefix])
					BCrypt::Password.create "#{data}#{Rfaye::Conf[:token]}", cost: 10
				end
			end
	end
end
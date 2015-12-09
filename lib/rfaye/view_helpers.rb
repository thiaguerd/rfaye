require 'rfaye/conf'
module Rfaye
	module ViewHelpers
		def pub onde, oque
			puts "pub begin".center(150,"_")
			puts "Rfaye::Conf.secure_prefix: #{Rfaye::Conf.secure_prefix}".center(150,"_")
			puts "pub #{oque} #{onde}"
			puts "pub end".center(150,"_")
		end

		def sub onde, oque
			puts "sub begin".center(150,"_")
			puts "Rfaye::Conf.secure_prefix: #{Rfaye::Conf.secure_prefix}".center(150,"_")
			puts "sub #{oque} #{onde}"
			puts "sub end".center(150,"_")
		end

		def un_sub onde
			puts "unsub begin".center(150,"_")
			puts "Rfaye::Conf.secure_prefix: #{Rfaye::Conf.secure_prefix}".center(150,"_")
			puts "unsub #{oque}"
			puts "unsub end".center(150,"_")
		end
	end
end
@.Rfaye =
	subs: {}
	sub: (channel, func, overwrite=false) ->
		channel = "/" + channel if channel.substring(0,1) != "/"
		if !Rfaye.subs[channel]
			if !func
				func = (data) ->
					try
						eval data
					catch e
                		eval("""(#{data}).call(this)""")

			Rfaye.subs[channel] = new Faye.Client("""http://#{window.location.hostname}:9292/faye""").subscribe(channel, func)
		else if overwrite
			Rfaye.subs[channel].cancel();
			Rfaye.subs[channel] = undefined
			Rfaye.sub(channel,func)
		null

	un_sub: (channel) ->
		channel = "/" + channel if channel.substring(0,1) != "/"
		Rfaye.subs[channel].cancel() if Rfaye.subs[channel]
		null

	pub: (channel,data) ->
		channel = "/" + channel if channel.substring(0,1) != "/"
		new Faye.Client("""http://#{window.location.hostname}:9292/faye""").publish(channel, if typeof data == "function" then data.toString() else data)
		null
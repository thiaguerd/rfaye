Rfaye = {
	subs: {},
	sub: function(channel,func){
		if(Rfaye.subs[channel] == undefined){
			Rfaye.subs[channel] = new Faye.Client('http://'+window.location.hostname+':9292/faye').subscribe(channel, func);
		}
	},
	unsub: function(channel){
		if(Rfaye.subs[channel] != undefined){
			Rfaye.subs[channel].cancel();
		}
	}
}
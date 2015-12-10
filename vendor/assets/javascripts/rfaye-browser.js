// Generated by CoffeeScript 1.10.0
(function() {
  this.Rfaye = {
    subs: {},
    sub: function(channel, func, overwrite) {
      if (overwrite == null) {
        overwrite = false;
      }
      if (channel.substring(0, 1) !== "/") {
        channel = "/" + channel;
      }
      if (!Rfaye.subs[channel]) {
        if (!func) {
          func = function(data) {
            console.log("data: ",data)
            var e, error;
            try {
              return eval(data);
            } catch (error) {
              e = error;
              if (e instanceof SyntaxError) {
                // return eval(data.substring(data.indexOf("{") + 1, data.lastIndexOf("}")));
                return eval("("+data+").call(this)")
              }
            }
          };
        }
        Rfaye.subs[channel] = new Faye.Client("http://" + window.location.hostname + ":9292/faye").subscribe(channel, func);
      } else if (overwrite) {
        Rfaye.subs[channel].cancel();
        Rfaye.subs[channel] = void 0;
        Rfaye.sub(channel, func);
      }
      return null;
    },
    un_sub: function(channel) {
      if (channel.substring(0, 1) !== "/") {
        channel = "/" + channel;
      }
      if (Rfaye.subs[channel]) {
        Rfaye.subs[channel].cancel();
      }
      return null;
    },
    pub: function(channel, data) {
      if (channel.substring(0, 1) !== "/") {
        channel = "/" + channel;
      }
      new Faye.Client("http://" + window.location.hostname + ":9292/faye").publish(channel, typeof data === "function" ? data.toString() : data);
      //new Faye.Client("http://" + window.location.hostname + ":9292/faye").publish(channel, data);
      return null;
    }
  };

}).call(this);

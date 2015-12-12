# Rfaye

Easy real time update

## Setup

On Gemfile add:
```ruby
gem "rfaye"
```

Create required files
```
rails g rfaye:install
```

On application.js add
```javascript
//= require rfaye
```

To start rfaye
```
rackup -s thin -E production rfaye.ru -p 9292
```

## JS Usage

Subscribe
```javascript
Rfaye.sub("chat/updates")
```

Publish
```javascript
Rfaye.pub("chat/updates",function(){
	$("#messages").append("<p>hey brother, see this rape batle https://youtu.be/-ChppfnazzE</p>")
})
```

Unsubscribe
```javascript
Rfaye.un_sub("chat/updates")
```

## JS Usage 2

Subscribe
```javascript
Rfaye.sub("chat/updates",function(data){
	$("#messages").append(data.message)
})
```

Publish
```javascript
Rfaye.pub("chat/updates",{
	message: "hey brother, see this rape batle https://youtu.be/-ChppfnazzE"
})
```

Overwrite subscription
```javascript
Rfaye.sub("chat/updates",function(data){
	$("#chat").append("<p>" + data.message + "</p>")
},true)
```

## Rails Usage 1

Subscribe
```rhtml
<%= sub "chat/updates" %>
```

Publish
```rhtml
<% pub "chat/updates" do %>
	$("#messages").append("<p>hey brother, see this rape batle https://youtu.be/-ChppfnazzE</p>")
<% end %>
```

## Rails Usage 2

Subscribe
```rhtml
<%= sub "chat/updates" do %>
	function(data){
		$("#chat").append(data.message)
	}
<% end %>
```

Publish
```rhtml
<% pub "chat/updates" do %>
	{message: "<p>hey brother, see this rape batle https://youtu.be/-ChppfnazzE</p>"}
<% end %>
```

## Rails Secure Usage

Note if you is sub in channel, anyware can pub messages via curl for example

```
curl http://localhost:9292/faye -H 'Content-Type: application/json' -d '{"channel": "/chat/updates", "data":"$(\"#messages\").append(\"<p>hey brother, see this rape batle https://youtu.be/-ChppfnazzE</p>\")"}'
```

This is the same thing as
```rhtml
<% pub "chat/updates" do %>
	$("#messages").append("<p>hey brother, see this rape batle https://youtu.be/-ChppfnazzE</p>")
<% end %>
```

For secure pub use a secure prefix on your channel
 

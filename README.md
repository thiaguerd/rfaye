# Rfaye

Rails app with real time update

### Setup

On Gemfile add:

```ruby
gem "rfaye"
```

Create required files

```ruby
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

### JS Usage

Simple Subscription

```javascript
Rfaye.sub("chat/updates")
```

Using this method you need pass the function to run like this:

Publish

```javascript
Rfaye.pub("chat/updates", function(){
	$("#messages").append("<p>hey brother, see this rape batle https://youtu.be/-ChppfnazzE</p>")
})
```

Subscription with expected parameters

```javascript
Rfaye.sub("chat/updates", function(data){
	$("#messages").append(data.message)
})
```

With this subscription you need publish like this

```javascript
Rfaye.pub("chat/updates", {message: "hey brother, see this rape batle https://youtu.be/-ChppfnazzE"})
```
Overwrite subscription

```javascript
Rfaye.sub("chat/updates", function(data){
	$("#messages").append(data.msg)
},true)
```

Unsubscribe

```javascript
Rfaye.un_sub("chat/updates")
```

## Rails Usage

Simple Subscription

```rhtml
<%= sub "chat/updates" %>
```

Publish

```rhtml
<% pub "chat/updates" do %>
	$("#messages").append("<p>hey brother, see this rape batle https://youtu.be/-ChppfnazzE</p>")
<% end %>
```

Subscription with expected parameters

```rhtml
<%= sub "chat/updates" do %>
	$("#chat").append(data.message)
<% end %>
```

Publish

```rhtml
<% pub "chat/updates" do %>
	{message: "<p>hey brother, see this rape batle https://youtu.be/-ChppfnazzE</p>"}
<% end %>
```

## Rails Secure Usage

Note if you is subscript in channel, everybody can publish messages via curl for example:

```
curl http://localhost:9292/faye -H 'Content-Type: application/json' -d '{"channel": "/chat/updates", "data":"$(\"#messages\").append(\"<p>hey brother, see this rape batle https://youtu.be/-ChppfnazzE</p>\")"}'
```

Return

```
[{"channel":"/chat/updates","successful":true}]
```

This is the same thing as:

```rhtml
<% pub "chat/updates" do %>
	$("#messages").append("<p>hey brother, see this rape batle https://youtu.be/-ChppfnazzE</p>")
<% end %>
```

For secure publish use a secure prefix on your channel, prefix default is sc (you can change this on config/rfaye.yml)

Subscribe

```rhtml
<%= sub "sc/chat/updates" do %>
	$("#chat").append(data.message)
<% end %>
```

Publish

```rhtml
<% pub "sc/chat/updates" do %>
	{message: "<p>hey brother, see this rape batle https://youtu.be/-ChppfnazzE</p>"}
<% end %>
```

If someone try this:

```
curl http://localhost:9292/faye -H 'Content-Type: application/json' -d '{"channel": "/sc/chat/updates", "data":"$(\"#messages\").append(\"<p>hey brother, see this rape batle https://youtu.be/-ChppfnazzE</p>\")"}'
```

Will see it

```
[{"channel":"/sc/chat/updates","error":"channel private!","successful":false}]
```
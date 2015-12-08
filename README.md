# rfaye
```javascript
//= require rfaye

Rfaye.sub("exec")

Rfaye.unsub("exec")
```


rackup -s thin -E production faye.ru 

curl http://localhost:9292/faye -H 'Content-Type: application/json' -d '{"channel": "/foo", "data": "treta bem loca"}'

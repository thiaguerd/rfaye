# rfaye
new Faye.Client('http://localhost:9292/faye').subscribe('/bar', function(message) {console.log("message: ",message)});
new Faye.Client('http://localhost:9292/faye').publish('/foo', {text: 'Hello world'});
rackup -s thin -E production faye.ru 
curl http://localhost:9292/faye -H 'Content-Type: application/json' -d '{"channel": "/foo", "data": "treta bem loca"}'
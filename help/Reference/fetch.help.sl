# fetch

- _fetch(address)_
- _fetch(address, options)_

Start the process of fetching a resource from the network,
returning a `Promise` which is fulfilled once the `Response` is available.

~~~
let url = 'https://rohandrape.net/sw/stsc3/lib/png/squeak-mouse.png';
url.fetch.then { :response | response.byteArray.then { :aByteArray | aByteArray.base64Encoded.postLine } }
~~~

* * *

See also: Promise, Response

Categories: Networking, Scheduling

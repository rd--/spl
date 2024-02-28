# fetchByteArray

- _fetchByteArray(aUrl)_

Answer a `Promise` that will resolve to a `ByteArray` having the contents of _aUrl_.

~~~
let url = 'https://rohandrape.net/sw/stsc3/lib/png/squeak-mouse.png';
url.fetchByteArray.then { :aByteArray | aByteArray.base64Encoded.postLine }
~~~

* * *

See also: ByteArray, fetchJson, fetchText, Url

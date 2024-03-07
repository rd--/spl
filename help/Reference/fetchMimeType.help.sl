# fetchMimeType

- _fetchMimeType(aUrl, aMimeType)_

Answer a `Promise` that will resolve to the contents of _aUrl_,
according to the value of _aMimeType_, which should be either:

- 'application/octet-stream'
- 'application/json'
- 'text/plain'

Fetch Utf-8 encoded text:

~~~
let url = 'https://rohandrape.net/sw/spl/README.md';
let mimeType = 'text/plain';
url.fetchMimeType(mimeType).then { :aString | aString.postLine }
~~~

Fetch and decode `Json`:

~~~
let url = 'https://rohandrape.net/sw/spl/config/preferences.json';
let mimeType = 'application/json';
url.fetchMimeType(mimeType).then { :anObject | anObject.postLine }
~~~

Fetch binary data:

~~~
let url = 'https://rohandrape.net/sw/stsc3/lib/png/squeak-mouse.png';
let mimeType = 'application/octet-stream';
url.fetchMimeType(mimeType).then { :aByteArray | aByteArray.base64Encoded.postLine }
~~~

* * *

See also: fetch, fetchByteArray, fetchJson, fetchText, Url

Categories: Network

# fetchMimeType

- _fetchMimeType(aUrl, aMimeType)_

Answer a `Promise` that will resolve to the contents of _aUrl_,
according to the value of _aMimeType_, which should be either:

- 'application/octet-stream'
- 'application/json'
- 'text/plain'

Fetch Utf-8 encoded text:

~~~spl async=String
let url = [
	'https://rohandrape.net/'
	'sw/spl/README.md'
].join('');
let mimeType = 'text/plain';
url.fetchMimeType(
	mimeType
)
~~~

Fetch and decode `Json`:

~~~spl async=Dictionary
let url = [
	'https://rohandrape.net/'
	'sw/spl/config/'
	'preferences.json'
].join('');
let mimeType = 'application/json';
url.fetchMimeType(
	mimeType
)
~~~

Fetch binary data:

~~~spl async=String
let url = [
	'https://rohandrape.net/'
	'sw/stsc3/lib/png/'
	'smalltalk-balloon.png'
].join('');
let mimeType = 'application/octet-stream';
url.fetchMimeType(
	mimeType
).then { :aByteArray |
	aByteArray
	.base64Encoded
}
~~~

* * *

See also: fetch, fetchByteArray, fetchJson, fetchText, Url

Categories: Network

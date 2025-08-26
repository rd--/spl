# fetchMimeType

- _fetchMimeType(aUrl, aMimeType)_

Answer a `Promise` that will resolve to the contents of _aUrl_,
according to the value of _aMimeType_, which should be either:

- 'application/octet-stream'
- 'application/json'
- 'text/plain'

Fetch Utf-8 encoded text:

~~~spl async
let mimeType = 'text/plain';
system
.splUrl('README.md')
.fetchMimeType(
	mimeType
)
~~~

Fetch and decode `Json`:

~~~spl async
let mimeType = 'application/json';
system
.splUrl('config/preferences.json')
.fetchMimeType(
	mimeType
)
~~~

Fetch binary data:

~~~spl async
let mimeType = 'application/octet-stream';
system
.splUrl('png/Emacs Editor.3.png')
.fetchMimeType(
	mimeType
).then { :aByteArray |
	aByteArray
	.base64Encode
}
~~~

* * *

See also: fetch, fetchByteArray, fetchJson, fetchText, Url

Categories: Network

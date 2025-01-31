# fetch

- _fetch(address)_
- _fetch(address, options)_

Start the process of fetching a resource from the network,
returning a `Promise` which is fulfilled once the `Response` is available.

Fetch a text file:

~~~spl async=String
let url = [
	'https://rohandrape.net/'
	'sw/spl/README.md'
].join('');
url.fetch.thenElse { :response |
	response.text
} { :reason |
	reason.postLine
}
~~~

Fetch a Json file:

~~~spl async=Dictionary
let url = [
	'https://rohandrape.net/'
	'sw/spl/config/'
	'preferences.json'
].join('');
url.fetch.thenElse { :response |
	response.json
} { :reason |
	reason.postLine
}
~~~

Fetch a binary file, read _Content-Type_ from `Headers`:

~~~spl async=String
let url = [
	'https://rohandrape.net/'
	'sw/stsc3/lib/png/'
	'smalltalk-balloon.png'
].join('');
url.fetch.thenElse { :response |
	response
	.headers
	.atIfAbsent('Content-Type') {
		''
	}
	.postLine;
	response.byteArray.then { :aByteArray |
		aByteArray
		.base64Encoded
	}
} { :reason |
	reason
}
~~~

Fetch a binary file as a `Blob` with associated mime type:

~~~spl async=String
let url = [
	'https://rohandrape.net/'
	'sw/stsc3/lib/png/'
	'smalltalk-balloon.png'
].join('');
url.fetch.thenElse { :response |
	response.blob.then { :aBlob |
		aBlob.type.postLine;
		aBlob.arrayBuffer.then { :anArrayBuffer |
			anArrayBuffer
			.asByteArray
			.base64Encoded
		}
	}
} { :reason |
	reason
}
~~~

* * *

See also: fetchByteArray, fetchJson, fetchText, Promise, Response

References:
_Mdn_
[1](https://developer.mozilla.org/en-US/docs/Web/API/fetch),
_Whatwg_
[1](https://fetch.spec.whatwg.org/#fetch-method)

Categories: Network, Scheduling

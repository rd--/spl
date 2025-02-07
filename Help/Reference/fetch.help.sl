# fetch

- _fetch(address)_
- _fetch(address, options)_

Start the process of fetching a resource from the network,
returning a `Promise` which is fulfilled once the `Response` is available.

Fetch a text file:

~~~spl async
system
.splUrl('README.md')
.fetch
.thenElse { :response |
	response.text
} { :reason |
	reason.postLine
}
~~~

Fetch a Json file:

~~~spl async
system
.splUrl('config/preferences.json')
.fetch
.thenElse { :response |
	response.json
} { :reason |
	reason.postLine
}
~~~

Fetch a binary file, read _Content-Type_ from `Headers`:

~~~spl async
system
.splUrl('png/Emacs Editor.3.png')
.fetch
.thenElse { :response |
	response
	.headers
	.atIfAbsent('Content-Type') {
		'*No Content-Type*'
	}
} { :reason |
	reason
}
~~~

Fetch a binary file as a `Blob` with associated mime type:

~~~spl async
system
.splUrl('png/Emacs Editor.3.png')
.fetch
.thenElse { :response |
	response
	.blob
	.then { :aBlob |
		aBlob
		.arrayBuffer
		.then { :anArrayBuffer |
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

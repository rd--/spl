# fetch

- _fetch(address)_
- _fetch(address, options)_

Start the process of fetching a resource from the network,
returning a `Promise` which is fulfilled once the `Response` is available.

Fetch a text file:

~~~
let url = 'https://rohandrape.net/sw/spl/README.md';
url.fetch.then { :response |
	response.text
}.then { :text |
	text.postLine
}
~~~

Fetch a Json file:

~~~
let url = 'https://rohandrape.net/sw/spl/config/preferences.json';
url.fetch.then { :response |
	response.json
}.then { :anObject |
	anObject.postLine
}
~~~

Fetch a binary file:

~~~
let url = 'https://rohandrape.net/sw/stsc3/lib/png/squeak-mouse.png';
url.fetch.then { :response |
	response.byteArray
}.then { :aByteArray |
	aByteArray.base64Encoded.postLine
}
~~~

* * *

See also: Promise, Response

Categories: Networking, Scheduling

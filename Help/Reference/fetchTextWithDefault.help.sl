# fetchTextWithDefault

- _fetchText(aUrl, aString)_

Answer a `Promise` that will resolve to a `String` having the contents of _aUrl_,
or `aString` if the `fetch` fails.

~~~
let url = 'https://rohandrape.net/DoesNotExist';
url.fetchTextWithDefault(
	'*Failed*'
).then { :aString |
	aString.postLine
}
~~~

* * *

See also: fetch, fetchByteArray, fetchJson, fetchText, String, Url

Categories: Network

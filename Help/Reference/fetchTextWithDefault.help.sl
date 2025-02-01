# fetchTextWithDefault

- _fetchText(aUrl, aString)_

Answer a `Promise` that will resolve to a `String` having the contents of _aUrl_,
or `aString` if the `fetch` fails.

~~~spl async network
let url = 'https://rohandrape.net/DoesNotExist';
url.fetchTextWithDefault(
	'*Failed*'
)
~~~

* * *

See also: fetch, fetchByteArray, fetchJson, fetchText, String, Url

Categories: Network

# fetchTextWithDefault

- _fetchText(aUrl, aString)_

Answer a `Promise` that will resolve to a `String` having the contents of _aUrl_,
or `aString` if the `fetch` fails.

~~~spl async
system
.splUrl('DoesNotExist')
.fetchTextWithDefault(
	'*Failed*'
)
~~~

* * *

See also: String, Url, fetch, fetchByteArray, fetchJson, fetchText

Categories: Network

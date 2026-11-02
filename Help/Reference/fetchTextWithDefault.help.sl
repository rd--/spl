# fetchTextWithDefault

- _fetchText(u, s)_

Answer a `Promise` that will resolve to a `String` having the contents of the Url _u_,
or the string _s if the `fetch` fails.

~~~spl async
system
.splUrl('DoesNotExist')
.fetchTextWithDefault(
	'*Failed*'
)
~~~

* * *

See also: String, Url, fetch, fetchByteArray, fetchJson, fetchText

Guides: Network Functions

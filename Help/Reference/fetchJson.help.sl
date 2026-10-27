# fetchJson

- _fetchJson(u)_

Answer a `Promise` that will resolve to a value having the decoded `Json` contents of the `Url` _u_.

~~~spl async
system
.splUrl('config/preferences.json')
.fetchJson
~~~

* * *

See also: Json, fetch, fetchByteArray, fetchMimeType, fetchText

Guides: Network Functions

Categories: Network

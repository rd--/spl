# fetchJson

- _fetchJson(u)_

Answer a `Promise` that will resolve to a value having the decoded `Json` contents of the `Url` _u_.

~~~spl async
system
.splUrl('config/preferences.json')
.fetchJson
~~~

* * *

See also: fetch, fetchByteArray, fetchMimeType, fetchText, Json

Guides: Network Functions

Categories: Network

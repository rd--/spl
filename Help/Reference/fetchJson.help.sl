# fetchJson

- _fetchJson(aUrl)_

Answer a `Promise` that will resolve to a value having the decoded `Json` contents of _aUrl_.

~~~spl async network
let url = [
	'https://rohandrape.net/'
	'sw/spl/config/preferences.json'
].join('');
url.fetchJson
~~~

* * *

See also: fetch, fetchByteArray, fetchMimeType, fetchText, Json

Categories: Network

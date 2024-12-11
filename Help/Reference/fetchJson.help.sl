# fetchJson

- _fetchJson(aUrl)_

Answer a `Promise` that will resolve to a value having the decoded `Json` contents of _aUrl_.

~~~
let url = [
	'https://rohandrape.net/'
	'sw/spl/config/preferences.json'
].join('');
url.fetchJson.then { :anObject |
	anObject.postLine
}
~~~

* * *

See also: fetch, fetchByteArray, fetchMimeType, fetchText, Json

Categories: Network

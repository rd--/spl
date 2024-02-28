# fetchJson

- _fetchJson(aUrl)_

Answer a `Promise` that will resolve to a value having the decoded `Json` contents of _aUrl_.

~~~
let url = 'https://rohandrape.net/sw/spl/config/preferences.json';
url.fetchJson.then { :aValue | aValue.postLine }
~~~

* * *

See also: fetchByteArray, fetchText, Json

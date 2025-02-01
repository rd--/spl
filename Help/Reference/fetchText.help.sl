# fetchText

- _fetchText(aUrl)_

Answer a `Promise` that will resolve to a `String` having the contents of _aUrl_.

~~~spl async
let url = [
	'https://rohandrape.net/'
	'sw/spl/README.md'
].join('');
url.fetchText
~~~

Handle failure:

~~~spl async
let url = [
	'https://rohandrape.net/'
	'DoesNotExist'
].join('');
url.fetchText.thenElse(identity:/1, identity:/1)
~~~

A file protocol `Url`:

~~~spl async
system
.splFile('Help/Reference/Url.help.sl')
.asFileUrl
.fetchText
~~~

* * *

See also: fetch, fetchByteArray, fetchJson, fetchTextWithDefault, String, Url

Categories: Network

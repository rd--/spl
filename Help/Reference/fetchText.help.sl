# fetchText

- _fetchText(aUrl)_

Answer a `Promise` that will resolve to a `String` having the contents of _aUrl_.

~~~
let url = [
	'https://rohandrape.net/'
	'sw/spl/README.md'
].join('');
url.fetchText.then { :aString |
	aString.postLine
}
~~~

Handle failure:

~~~
let url = [
	'https://rohandrape.net/'
	'DoesNotExist'
].join('');
url.fetchText.thenElse { :aString |
	aString.postLine
} { :err |
	'*Failed*'.postLine
}
~~~

A file protocol `Url`:

~~~
system
.splFile('Help/Reference/Url.help.sl')
.asFileUrl
.fetchText.then { :aString |
	aString.postLine
}
~~~

* * *

See also: fetch, fetchByteArray, fetchJson, fetchTextWithDefault, String, Url

Categories: Network

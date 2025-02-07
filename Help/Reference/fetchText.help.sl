# fetchText

- _fetchText(aUrl)_

Answer a `Promise` that will resolve to a `String` having the contents of _aUrl_.

~~~spl async
system
.splUrl('README.md')
.fetchText
~~~

Handle failure:

~~~spl async
system
.splUrl('DoesNotExist')
.fetchText
.thenElse(identity:/1, identity:/1)
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

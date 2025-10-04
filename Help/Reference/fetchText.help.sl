# fetchText

- _fetchText(u)_

Answer a `Promise` that will resolve to a `String` having the contents of the `Url` _u_.

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
.splFileName('Help/Reference/Url.help.sl')
.asFileUrl
.fetchText
~~~

* * *

See also: fetch, fetchByteArray, fetchJson, fetchTextWithDefault, String, Url

Guides: Network Functions

Categories: Network

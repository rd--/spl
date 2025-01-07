# LibraryItem

A `Type` holding a library item.

A `LibraryItem` is an arbitrary value that is cached by the system the first time it is fetched.

A `LibraryItem` has a `name`, a `url`, a `mimeType`, a `parser`, a `useLocalStorage` flag and a `value`.

The names of library items are triples of _Area/Subject/Entry_.
Areas include _Text_, _Graphics_, _Geometry_, _Chemistry_, _Music_ and _System_.
Subjects include _Help_, _Unicode_, _Tuning_ and _SuperCollider_.

The `library` method at `System` answers a `Record` of the available library items:

```
>>> system.library.isRecord
true

>>> system.library.elementType
'LibraryItem'

>>> system.library.includesKey(
>>> 	'Text/Unicode/CharacterDatabase'
>>> )
true
```

Request all library items be fetched:

~~~
system.library.collect(request:/1)
~~~

* * *

See also: awaitLibraryItem, helpIndex, requestLibraryItem, requireLibraryItem, unicodeData

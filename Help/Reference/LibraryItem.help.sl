# LibraryItem

A `Type` holding a library item.

A `LibraryItem` is an arbitrary value that is cached by the system the first time it is fetched.

A `LibraryItem` has
a `category`,
a `name`,
a `url`,
a `mimeType`,
a `parser` and
its `contents`,
which are stored both as
`unparsedContents` and
`parsedContents`.

The categories of library items are of the form _Area/Subject_.
Areas include _Text_, _Graphics_, _Geometry_, _Chemistry_, _Music_ and _System_.
Subjects include _Help_, _Text_, _Tuning_ and _SuperCollider_.

The `library` method at `System` answers a `Record` of the available library items:

```
>>> system.library.isRecord
true

>>> system.library.elementType
'LibraryItem'

>>> system.library.includesKey(
>>> 	'UnicodeCharacterDatabase'
>>> )
true
```

Request all library items be fetched,
unless the contents are already stored:

~~~spl async
system
.library
.collect(request:/1)
.values
.allFulfilled
~~~

* * *

See also: addLibraryItem, awaitLibraryItem, helpIndex, requestLibraryItem, requireLibraryItem, unicodeCharacterDatabase

Guides: Library Catalogue

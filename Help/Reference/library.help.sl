# library

- _library(system)_

Answer a `Record` holding the `LibraryItem` library of `system`.

Count the entries in the library:

```
>>> system.library.size
36
```

Check if the library includes a particular entry:

```
>>> system
>>> .library
>>> .includesKey('ScalaScaleArchive')
true
```

Request all library items be in the interpreter cache:

~~~spl async
system.library.collect(request/1)
~~~

* * *

See also: LibraryItem, Record, system

Guides: Library Catalogue, System Functions

# addLibraryItem

- _addLibraryItem(aSystem, aLibraryItem)_

Add _aLibraryItem_ to _aSystem_.
Add an entry at the `library` dictionary,
the key is the `name` of the library item.
Initiate a `cachedFetch` request for the item,
which will store the parsed item contents in the interpreter cache.

If the library item already exists an error is signaled.

`addLibraryItem` is called when a `LibraryItem` record is specified in a package definition.

* * *

See also: cachedFetch, library, LibraryItem, system, System

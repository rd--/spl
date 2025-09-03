# addLibraryItem

- _addLibraryItem(system, i)_

Add the `LibraryItem` _i_ to `system`.
Add an entry at the `library` dictionary,
the key is the `name` of the library item.
Initiate a `cachedFetch` request for the item,
which will store the _unparsed_ item contents in the interpreter cache.

If the library item already exists an `error` is signaled.

`addLibraryItem` is called when a `LibraryItem` record is specified in a package definition.

_Rationale_:
The cached fetch request does not parse the contents.
The system may initially add many library items,
the parsing is delayed until an item is actually required.

* * *

See also: cachedFetch, library, LibraryItem, system, System

Guides: Library Catalogue

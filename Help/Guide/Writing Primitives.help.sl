# Writing Primitives

The primitive for accessing an item in a collection is `atIfAbsent`.
For an example implementation see `PrimitiveSequence`.

The primitive checks that the index is a valid integer for the collection,
and if it is returns the appropriate element.

If the primitive fails the error handling is performed by the method.

Note that all names are underscore prefixed at the implementation level.
Also note that the implementation language is zero-indexed.

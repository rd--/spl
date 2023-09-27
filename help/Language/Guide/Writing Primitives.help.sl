# Writing Primitives

Primitives have Smalltalk semantics and are written inline using a Smalltalk-like notation.

If a primitive succeeds it returns from the block,
if it fails it continues with the remainder of the definition.

Below is the implementation of _at_ from _ArrayedCollection_.

```
at { :self :anInteger |
	<primitive:
		if(sl.arrayCheckIndex(_self, _anInteger)) {
			return _self[_anInteger - 1];
		}
	>
	self.errorInvalidIndex('at', index)
}
```

The primitive checks that the index is a valid integer for the collection,
and if it is returns the appropriate element.

If the primitive fails the error handling is performed by the method.

Note that all names are underscore prefixed at the implementation level.
Also note that the implementation language is zero-indexed.

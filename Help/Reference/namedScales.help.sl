# namedScales

- _namedScales(aString)_

Answer the `List` of `Scale`s which are named by _aString_,
according to the Scala scale archive.

```
>>> 'Whole-tone'
>>> .namedScales
>>> .collect(intervals:/1)
[
	1 1 1 1 1 1;
	2 2 2 2 2 2
]
```

It is an `error` if the name is not in the archive:

```
>>> {
>>> 	'*unnamed scale*'.namedScales
>>> }.hasError
true
```

_Note:_
The archive is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: LibraryItem, intervalName, namedScale, Scale

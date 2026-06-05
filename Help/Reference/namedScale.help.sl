# namedScale

- _namedScale(s)_

Answer the `Scale` which is named by the string _s_,
according to the Scala scale archive.

```
>>> 'Major'.namedScale.intervals
[2 2 1 2 2 2 1]
```

It is an `error` if the name belongs to more than one scale in the archive,
see `namedScaleList`:

```
>>> {
>>> 	'Whole-tone'.namedScale
>>> }.hasError
true

>>> 'Whole-tone'.namedScaleList
>>> .collect(intervals:/1)
[
	1 1 1 1 1 1;
	2 2 2 2 2 2
]
```

It is an `error` if the name is not in the archive:

```
>>> {
>>> 	'*unnamed scale*'.namedScale
>>> }.hasError
true
```

_Note:_
The archive is a `LibraryItem`,
and this function requires the item be in the interpreter cache.

* * *

See also: LibraryItem, intervalName, namedScaleList, scalaScaleArchive, Scale, scaleNameList

Guides: Scale Functions

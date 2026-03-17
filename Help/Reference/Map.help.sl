# Map

- _Map([k₁ v₁; k₂ v₂; …])_

A `Map` is a `Dictionary` type where the keys are compared using the identical to (`==`) operator.
See `isImmediate` for deciding if a value is suitable as a key.

Construct a `Map` from a list of lists:

```
>>> Map([1 2; 3 4; 5 6])
[1: 2, 3: 4, 5: 6]

>>> Map([[1, [2, 3]], [3, [4, 5, 6]]])
[1: [2 3], 3: [4 5 6]]
```

Construct an empty `Map`:

```
>>> Map()
[:]
```

`Map` treats negative zero as zero when used as a key:

```
>>> let m = Map();
>>> m[-0] := -0;
>>> (
>>> 	m.associations,
>>> 	m.keys.first.isNegativeZero,
>>> 	m.values.first.isNegativeZero
>>> )
([0 -> -0], false, true)
```

A Conway sequence,
OEIS [A004001](https://oeis.org/A004001):

~~~spl svg=A oeis=A004001
let a = Map { :n |
	(n <= 2).if {
		1
	} {
		a[a[n - 1]] + a[n - a[n - 1]]
	}
};
a[1:75].scatterPlot
~~~

![](Help/Image/Map-A.svg)

Note: `Map` is _IdentityDictionary_ in Smalltalk.

* * *

See also: asMap, Dictionary, isImmediate, Record

Guides: Dictionary Functions, Map Syntax

Categories: Collection, Type

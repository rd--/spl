# collect

- _collect(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each element of _aCollection_ as the argument.
Collect the resulting values into a collection like the receiver.
Answer the new collection.

At `Range`:

```
>>> (2, 6 .. 14).collect { :x | x * x }
[4 36 100 196]
```

At `List`:

```
>>> [2, 6 .. 14].collect { :x | x * x }
[4 36 100 196]
```

At `Record`:

```
>>> (x: 6, y: 10, z: 14).collect { :x | x * x }
(x: 36, y: 100, z: 196)
```

At `IdentityBag`:

```
>>> [2, 6 .. 14]
>>> .asIdentityBag
>>> .collect(square:/1)
[4 36 100 196].asIdentityBag
```

At `IdentitySet`:

```
>>> [2, 6 .. 14]
>>> .asIdentitySet
>>> .collect(square:/1)
[4 36 100 196].asIdentitySet
```

At `Tree`:

```
>>> Tree(4, [Tree(9, [Tree(16, [])])])
>>> .collect(sqrt:/1)
Tree(2, [Tree(3, [Tree(4, [])])])
```

At `Stream`:

```
>>> [1 .. 9].asStream
>>> .collect(square:/1)
>>> .upToEnd
[1 4 9 16 25 36 49 64 81]
```

Make a triangular array:

```
>>> 1:5.collect { :i |
>>> 	1:i.collect { :j |
>>> 		10 * i + j
>>> 	}
>>> }
[
	11;
	21 22;
	31 32 33;
	41 42 43 44;
	51 52 53 54 55
]
```

Collect is implemented in terms of `new`, `do` and `add` for unordered collections,
and in terms of `ofSize`, `size`, `at` and `atPut` for sequences.

* * *

See also: collectCatenate, deepCollect, do, collectCatenate, map, reject, replace, select, table, withCollect, withIndexCollect

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:map)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Map.html)
[2](https://reference.wolfram.com/language/ref/TreeMap.html),
_Smalltalk_
5.7.1.10

Categories: Enumerating

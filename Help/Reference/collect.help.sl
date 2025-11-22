# collect

- _collect(c, f:/1)_
- _collect(c₁, c₂, f:/2)_
- _collect(c₁, c₂, c₃, f:/3)_

Evaluate the block _f_ with each element of the collection _c_ as the argument.
Collect the resulting values into a collection like the receiver.
Answer the new collection.

At `Range`:

```
>>> 2:14:4.collect { :x |
>>> 	x * x
>>> }
[4 36 100 196]
```

At `List`:

```
>>> [2 6 10 14].collect { :x |
>>> 	x * x
>>> }
[4 36 100 196]
```

At `Record`:

```
>>> (x: 6, y: 10, z: 14).collect { :x |
>>> 	x * x
>>> }
(x: 36, y: 100, z: 196)
```

At `IdentityMultiset`:

```
>>> [2, 6 .. 14]
>>> .asIdentityMultiset
>>> .collect(square:/1)
[4 36 100 196].asIdentityMultiset
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

Collect with another sequential collection:

```
>>> [1 2 3].collect([4 5 6], +)
[5 7 9]
```

Collect with another two sequential collections:

```
>>> [1 2 3].collect(
>>> 	[4 5 6],
>>> 	[7 8 9]
>>> ) { :i :j :k |
>>> 	i * j + k
>>> }
[11 18 27]

>>> let [a, b, c] = [1 2 3; 4 5 6; 7 8 9];
>>> collect(a, b, c, multiplyAdd:/3)
[11 18 27]
```

Collect is implemented in terms of `new`, `do` and `add` for unordered collections,
and in terms of `ofSize`, `size`, `at` and `atPut` for sequences.

* * *

See also: collectCatenate, deepCollect, do, map, reject, replace, select, table, withIndexCollect

Guides: Collection Functions, Dictionary Functions, List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:map)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Map.html)
[2](https://reference.wolfram.com/language/ref/TreeMap.html),
_Smalltalk_
5.7.1.10

Categories: Enumerating

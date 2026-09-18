# collect

- _collect(c, f/1)_

Evaluate the block _f_ with each element of the collection _c_ as the argument.
Collect the resulting values into a collection like _c_.
Answer the new collection.

At `List`:

```
>>> [2 6 10 14].collect { :x |
>>> 	x * x
>>> }
[4 36 100 196]
```

At `Range`,
answers a `List`:

```
>>> 2:14:4.collect { :x |
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
>>> IdentityMultiset[2, 6 .. 14]
>>> .collect(square/1)
IdentityMultiset[4 36 100 196]
```

At `IdentitySet`:

```
>>> IdentitySet[2, 6 .. 14]
>>> .collect(square/1)
IdentitySet[4 36 100 196]
```

At `Tree`:

```
>>> Tree(4, [Tree(9, [Tree(16, [])])])
>>> .collect(sqrt/1)
Tree(2, [Tree(3, [Tree(4, [])])])
```

At `Stream`:

```
>>> Stream[1 .. 9]
>>> .collect(square/1)
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

To collect with another sequential collection use `map` or `withCollect`:

```
>>> +.map([1 2 3], [4 5 6])
[5 7 9]

>>> [1 2 3].withCollect([4 5 6], +)
[5 7 9]
```

To collect with another two sequential collections use `map` or `withWithCollect`:

```
>>> let [a, b, c] = [1 2 3; 4 5 6; 7 8 9];
>>> timesPlus/3.map(a, b, c)
[11 18 27]

>>> [1 2 3].withWithCollect(
>>> 	[4 5 6],
>>> 	[7 8 9]
>>> ) { :i :j :k |
>>> 	i * j + k
>>> }
[11 18 27]
```

Square array of polygonal numbers read by antidiagonals upwards,
OEIS [A057145](https://oeis.org/A057145):

~~~spl svg=A oeis=A057145
2:13.collect { :n |
	let m = n - 1;
	1:m.collect { :k |
		k * (3 - (k * k) - n + (k * n)) / 2
	}
}.catenate.scatterPlot
~~~

![](Help/Image/collect-A.svg)

Tribonacci array,
OEIS [A027023](https://oeis.org/A027023):

~~~spl svg=B oeis=A027023
let t = { :n :k |
	(k < 3 | { k = (2 * n) }).if {
		1
	} {
		1:3.sum { :i |
			t(n - 1, k - i)
		}
	}
};
0:7.collect { :n |
	let m = 2 * n;
	0:m.collect { :k |
		t(n, k)
	}
}.catenate.discretePlot
~~~

![](Help/Image/collect-B.svg)

Collect is implemented in terms of `new`, `do` and `add` for unordered collections,
and in terms of `ofSize`, `size`, `at` and `atPut` for sequences.

* * *

See also: collectCatenate, deepCollect, do, map, reject, replace, select, table, withCollect, withIndexCollect, withWithCollect

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

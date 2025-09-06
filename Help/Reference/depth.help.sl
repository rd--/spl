# depth

- _depth(c)_

Answer the maximum number of indices needed to specify any part of the collection _c_,
plus `one`.

Objects that are not collections have a `depth` of `one`.

```
>>> 1.depth
1
```

A _vector_ has depth two:

```
>>> [1 2 3].depth
2
```

The empty list has `depth` two:

```
>>> [].depth
2
```

A _matrix_, regular and irregular, has depth three:

```
>>> let m = [1 2; 3 4; 5 6];
>>> (m.depth, m.dimensions)
(3, [3 2])

>>> let m = [1 2; 3 4 5];
>>> (m.depth, m.dimensions)
(3, [2])
```

Only the deepest part of the expression affects the depth:

```
>>> [[[1]]].depth
4

>>> [[[1], 2]].depth
4
```

At deeply nested `List`:

```
>>> [1, [3, [5, [7, [9]]]]].depth
6

>>> [[[[[1], 3], 5], 7], 9].depth
6
```

A `Tuple` is not a collection and has depth one:

```
>>> (1, (3, (5, (7, 9)))).depth
1
```

At `Tree`:

```
>>> [1, [2, [3], 4], 5]
>>> .expressionTree(nil)
>>> .depth
4
```

A `String` has depth one:

```
>>> 'x'.depth
1
```

A `Number` has depth one:

```
>>> 12345.depth
1

>>> 3J1.depth
1

>>> 2/3.depth
1

>>> 2.sqrt.depth
1
```

The depth of values is considered when computing the depth of a `Record`:

```
>>> (x: 1, y: 2, z: 3).depth
2

>>> (x: 1, y: [2 3], z: [4 5; 6 7]).depth
4
```

Depth of a nested `Record`:

```
>>> (x: (y: (z: 3))).depth
4
```

`depth` returns a depth one greater than that returned by `rank` or `arrayDepth`:

```
>>> let v = [1 2 3];
>>> let m = [1 2; 3 4];
>>> (
>>> 	v.depth, v.rank, v.arrayDepth,
>>> 	m.depth, m.rank, m.arrayDepth
>>> )
(2, 1, 1, 3, 2, 2)
```

At `Range`:

```
>>> 1:9.depth
2
```

`depth` returns a depth one greater than that returned by `arrayDepth`:

```
>>> (1.depth, 1.arrayDepth)
(1, 0)

>>> ([1 2 3].depth, [1 2 3].arrayDepth)
(2, 1)
````

`depth` counts a `Record` as a single level,
it counts the corresponding list of `Assocation`s as two:

```
>>> (a: 1, b: 2, c: 3).depth
2

>>> ['a' -> 1, 'b' -> 2, 'c' -> 3].depth
3
```

An `Association` has a `depth` of `one` plus the depth of the value:

```
>>> ('a' -> 1).depth
2

>>> ('a' -> [1]).depth
3
```

* * *

See also: arrayDepth, dimensions, leafCount, rank

Guides: Tree Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Depth.html)

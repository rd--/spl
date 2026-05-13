# atAll

- _atAll(c, [i₁ i₂ …])_

If _c_ is a sequential collection,
answer a new collection like the collection _c_ containing all elements at indices _i_.

At `List`:

```
>>> ['1' '2' '3' '4'].atAll([3 2 4])
['3' '2' '4']
```

At a square 5×5 matrix select the first, third and fifth rows:

```
>>> [5 5].iota.atAll([1 3 5])
[
	 1  2  3  4  5;
	11 12 13 14 15;
	21 22 23 24 25
]
```

At `String`:

```
>>> 'abcde'.atAll([2 4 1 3 5])
'bdace'
```

If _c_ is a dictionary,
answer a new collection that is like the collection _i_:

At `Record`:

```
>>> (x: 1, y: 2, z: 3).atAll(['z' 'x'])
[3 1]
```

At `Map`:

```
>>> Map[0 -> 3, 1 -> 2, 2 -> 1]
>>> .atAll([2 1 0])
[1 2 3]
```

The infix form of `atAll` is `@*`:

```
>>> ['1' '2' '3' '4'] @* [3 2 4]
['3' '2' '4']

>>> (x: 1, y: 2, z: 3) @* ['x' 'z']
[1 3]
```

It is an error if the index is not a collection:

```
>>> {
>>> 	['1' '2' '3'].atAll(2)
>>> }.hasError
true
```

* * *

See also: at, atAllBlend, atAllPath, atAllPin, atAllPut, atAllSymmetrical, atPath

Guides: AtAll Syntax, Indexing Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/From),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/curlylf#dyadic)

Categories: Accessing

# catenate

- _catenate([c₁ c₂ …])_

Join the collectionss _c_ by into a new collection of the same type.
The operator form is `++`.

At `List`:

```
>>> [1 2 3; 4 5 6; 7 8 9].++
[1 2 3 4 5 6 7 8 9]

>>> [1 2 3; 4 5; 6].catenate
[1 2 3 4 5 6]

>>> let x = ByteArray([1 2 3]);
>>> [x x x].catenate
ByteArray([1 2 3 1 2 3 1 2 3])
```

Catenate two matrices vertically, ie. columnwise:

```
>>> [
>>> 	1 2; 3 4:;
>>> 	5 6; 7 8; 9 0
>>> ].catenate
[
	1 2;
	3 4;
	5 6;
	7 8;
	9 0
]
```

Catenate effectively flattens the first two levels of a high-dimensional array:

```
>>> [2 2 2].iota.catenate
[1 2; 3 4; 5 6; 7 8]
```

Although the answer type is ordinarily given by the element type,
there is a special case for an empty collection,
which answers itself.

```
>>> [].catenate
[]

>>> let x = [];
>>> x.catenate == x
true
```

The elements must not be immutable:

```
>>> {
>>> 	['x' 'y' 'z'].catenate
>>> }.hasError
true
```

Where supported `catenate` is displayed as ⧻.

* * *

See also: ++, +++, collectCatenate, dictionaryJoin, flatten

Guides: List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:concat),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Catenate.html.en)

Unicode: U+29FB ⧻ Triple Plus

Categories: Converting

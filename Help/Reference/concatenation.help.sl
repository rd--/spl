# concatenation

- _c₁ ++ c₂_

Answer a new collection comprising the collection _c₁_ concatenated with _c₂_.
If the collections are sequences, the answer is a sequence.
The operator form is `++`.

At `List`:

```
>>> [1 2 3] ++ [4 5 6]
[1 2 3 4 5 6]
```

With empty list:

```
>>> [] ++ [1 2 3]
[1 2 3]

>>> [1 2 3] ++ []
[1 2 3]

>>> [] ++ []
[]
```

Join two matrices to make longer columns:

```
>>> [1 2; 3 4] ++ [5 6; 7 8]
[
	1 2;
	3 4;
	5 6;
	7 8
]
```

At `String`:

```
>>> 'book' ++ 'case'
'bookcase'

>>> '123' ++ '456'
'123456'
```

With empty string:

```
>>> 'xyz' ++ ''
'xyz'

>>> '' ++ 'xyz'
'xyz'

>>> '' ++ ''
''
```

At `Record`:

```
>>> (x: 1) ++ (y: 2, z: 3)
(x: 1, y: 2, z: 3)
```

With empty record:

```
>>> (x: 1) ++ (:)
(x: 1)

>>> (:) ++ (x: 1)
(x: 1)

>>> (:) ++ (:)
(:)
```

Biases right,
keys that are given in both records will retain the value from the right hand side record:

```
>>> (x: 1, y: 2) ++ (y: 3, z: 4)
(x: 1, y: 3, z: 4)
```

At `Map`:

```
>>> ['x': 1] ++ ['y': 2, 'z': 3]
['x': 1, 'y': 2, 'z': 3]
```

* * *

See also: ++, +++, catenate, flatten, join, stringJoin

Guides: Dictionary Functions, List Functions

References:
_Common Lisp_
[1](http://clhs.lisp.se/Body/f_append.htm),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:-43--43-)
_Mathematica_
[1](https://mathworld.wolfram.com/Concatenation.html)
[2](https://reference.wolfram.com/language/ref/Join.html)
[3](https://reference.wolfram.com/language/ref/StringJoin.html)
[4](https://reference.wolfram.com/language/ref/Catenate.html),
_Smalltalk_
5.7.8.1,
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#sec-array.prototype.concat)

Categories: Copying

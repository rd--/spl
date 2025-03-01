# ++

- _aCollection ++ anotherCollection_
- _aCollection.++_

The binary form answer a new collection comprising _aCollection_ concatenated with _anotherCollection_.
If the collections are sequences, the answer is a sequence.

At `List`:

```
>>> [1 2 3] ++ [4 5 6]
[1 2 3 4 5 6]
```

With empty list:

```
>>> [] ++ [1 2 3]
[1 2 3]

>>> [3 2 1] ++ []
[3 2 1]
```

At `Record`:

```
>>> (x: 1) ++ (y: 2, z: 3)
(x: 1, y: 2, z: 3)
```

With empty record:

```
>>> (x: 1) ++ ()
(x: 1)

>>> () ++ (x: 1)
(x: 1)

>>> () ++ ()
()
```

Biases right, keys that are given in both records will retain the value from the right hand side record:

```
>>> (x: 1, y: 2) ++ (y: 3, z: 4)
(x: 1, y: 3, z: 4)
```

At `String`:

```
>>> '123' ++ '456'
'123456'
```

With empty string:

```
>>> 'xyz' ++ ''
'xyz'

>>> '' ++ 'xyz'
'xyz'
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

The unary form flattens the collection by one level into a `List`:

```
>>> [1 2 3; 4 5 6; 7 8 9].++
[1 2 3 4 5 6 7 8 9]

>>> [1 2 3; 4 5; 6].++
[1 2 3 4 5 6]

>>> [[1, 2], [], [3, 4, 5]].++
[1, 2, 3, 4, 5]
```

Where supported `++` is displayed as ⧺.

_Note:_ In Smalltalk the binary form is the comma operator.

* * *

See also: +++, catenate, flatten, join

Unicode: U+29FA ⧺ Double plus

References:
_Common Lisp_
[1](http://clhs.lisp.se/Body/f_append.htm),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:-43--43-)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Catenate.html)
[1](https://reference.wolfram.com/language/ref/Join.html),
_Smalltalk_
5.7.8.1

Categories: Copying

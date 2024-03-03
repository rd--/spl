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

At `Record`:

```
>>> (x: 1) ++ (y: 2, z: 3)
(x: 1, y: 2, z: 3)
```

At `String`:

```
>>> '123' ++ '456'
'123456'
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

Where supported this operator is displayed as ⧺.

_Note:_ In Smalltalk the binary form is the comma operator.

* * *

See also: ++, concatenation

Unicode: U+29FA ⧺ Double plus

References:
_Smalltalk_
5.7.8.1

Categories: Copying

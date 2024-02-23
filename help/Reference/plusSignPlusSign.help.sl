# ++

- _aCollection ++ anotherCollection_

Answer a new collection comprising _aCollection_ concatenated with the _anotherCollection_.
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

Where supported this operator is displayed as ⧺.

_Note:_ In Smalltalk this is the comma operator.

* * *

See also: concatenation

Unicode: U+29FA ⧺ Double plus

Categories: Copying

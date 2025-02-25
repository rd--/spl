# pick

- _pick(aList, anotherList, anObject)_

Pick out elements of _aList_ for which the corresponding element of _anotherList_ is equal to _anObject_.

Pick out elements wherever `one` appears in the selector list:

```
>>> 1:5.pick([1 0 1 0 0], 1)
[1 3]

>>> 1:5 # [1 0 1 0 0]
[1 3]
```

Pick out elements from a matrix:

```
>>> [2 3].iota.pick([1 0 0; 0 1 1], 1)
[1; 5 6]
```

Pick out elements wherever `true` appears in the selector list:

```
>>> 1:4.pick([true false false true], true)
[1 4]
```

* * *

See also: #, reject, select

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Pick.html)

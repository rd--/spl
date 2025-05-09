# takeDrop

- _takeDrop(aList, n)_

Answer a `List` of two lists where the first contains the first _n_ elements of _aList_ and the second contains the rest.

```
>>> [1 .. 9].takeDrop(3)
[1 2 3; 4 5 6 7 8 9]
```

Equivalent to `take` and `drop`:

```
>>> let x = [1 .. 9];
>>> [x.take(3), x.drop(3)]
[1 2 3; 4 5 6 7 8 9]
```

Equivalent to `takeList` calculating the size of the second list automatically:

```
>>> [1 .. 9].takeList([3 6])
[1 2 3; 4 5 6 7 8 9]
```

* * *

See also: drop, take, takeList

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TakeDrop.html)

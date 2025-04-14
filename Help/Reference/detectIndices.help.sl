# detectIndices

- _detectIndices(aSequence, aBlock:/1)_

Answer the indices of the items in _aSequence_ that answer `true` to _aBlock_.

Find indices of even numbers:

```
>>> [9 .. 1].detectIndices(isEven:/1)
[2 4 6 8]
```

Find indices of `zero`:

```
>>> [1 .. 9].detectIndices(isZero:/1)
[]
```

Find indices of numbers greater than six:

```
>>> [1, 3 .. 9].detectIndices { :x |
>>> 	x > 6
>>> }
[4 5]
```

* * *

See also: detectIndex, indicesOf

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Position.html)

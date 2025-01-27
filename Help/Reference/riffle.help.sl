# riffle

- _riffle(aSequence, anotherSequence)_

Answer a `List` that has, alternately, the elements of _aSequence_ and _anotherSequence_.

```
>>> [3 4 5].riffle([-1 -2])
[3 -1 4 -2 5]
```

If _anotherSequence_ has too few items it is recycled as required:

```
>>> [3 4 5 6].riffle([-1 -2])
[3 -1 4 -2 5 -1 6]
```

It is an error if _anotherSequence_ has too many elements:

```
>>> { [3 4 5].riffle([-1 -2 -3]) }.ifError { true }
true
```

Alternate positive and negative integers:

```
>>> 1:10.riffle(-1:-1:-9)
[1 -1 2 -2 3 -3 4 -4 5 -5 6 -6 7 -7 8 -8 9 -9 10]
```

* * *

See also: intercalate, interleave, intersperse, transposed

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Riffle.html)

Categories: Rearranging

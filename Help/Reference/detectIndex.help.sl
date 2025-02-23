# detectIndex

- _detectIndex(aSequence, aBlock:/1)_

Answer the index of the first item in _aSequence_ that answers `true` to _aBlock_.
Answer `nil` if there is no such item.

Find index of first even number:

```
>>> 9:-1:1.detectIndex(isEven:/1)
2
```

Find index of first `zero`:

```
>>> 1:9.detectIndex(isZero:/1)
nil
```

Find index of first number greater than six:

```
>>> (1, 3 .. 9).detectIndex { :x |
>>> 	x > 6
>>> }
4
```

Note that for sorted sequences, `binaryDetectIndex` will, on average, be quicker:

```
>>> (1, 3 .. 9).binaryDetectIndex { :x |
>>> 	x > 6
>>> }
4
```

* * *

See also: binaryDetectIndex, bisect, detect, detectIndexIfFoundIfNone, indexOf

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FirstPosition.html),
_W_
[1](https://en.wikipedia.org/wiki/Linear_search)

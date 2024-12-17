# padRight

- _padRight(aSequence, anInteger, anObject)_

Answer a sequence of length _anInteger_ by suffixing _aSequence_ with copies of _anObject_.

At `List`:

```
>>> [1 2 3].padRight(9, 0)
[1 2 3 0 0 0 0 0 0]
```

Not in place:

```
>>> let a = [1 2 3];
>>> let b = a.padRight(5, 0);
>>> (a, b)
([1 2 3], [1 2 3 0 0])
```

At `String`:

```
>>> 'xyz'.padRight(9, ' ')
'xyz      '
```

* * *

See also: #, ++, padLeft, padLeftAndRight, size

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PadRight.html)

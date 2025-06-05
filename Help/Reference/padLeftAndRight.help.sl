# padLeftAndRight

- _padLeftAndRight(aSequence, anInteger, anObject)_

Answer a sequence of length _anInteger_ by prefixing and suffixing _aSequence_ with copies of _anObject_.

For both odd or both even sizes is truly centered:

```
>>> [1 2 3].padLeftAndRight(9, 0)
[0 0 0 1 2 3 0 0 0]

>>> [1 2 3 4].padLeftAndRight(12, 0)
[0 0 0 0 1 2 3 4 0 0 0 0]
```

For mismatches biases leftwards:

```
>>> [1 2 3].padLeftAndRight(8, 0)
[0 0 1 2 3 0 0 0]

>>> [1 2 3 4].padLeftAndRight(11, 0)
[0 0 0 1 2 3 4 0 0 0 0]
```

* * *

See also: #, ++, arrayPad, padLeft, padRight, size

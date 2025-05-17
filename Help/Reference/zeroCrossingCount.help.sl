# zeroCrossingCount

- _zeroCrossingCount(aSequence)_

Answer a boolean sequence in which `true` corresponds to zero crossings in _aSequence_.

Zero crossings of a list:

```
>>> [4 0 1 -2 1 -2 -3 -1 3]
>>> .zeroCrossingCount
4
```

A zero-crossing occurs when the last non-zero `sign` is opposite to the current `sign`:

```
>>> [-1 0 0 0 1]
>>> .zeroCrossingCount
1
```

Visiting zero is not a zero crossing:

```
>>> [0 1 0 1 0 1 0 -1]
>>> .zeroCrossingCount
1
```

* * *

See also: zeroCrossingDetect

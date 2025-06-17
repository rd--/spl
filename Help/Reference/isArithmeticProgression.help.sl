# isArithmeticProgression

- _isArithmeticProgression(l)_

Answer `true` if the list _l_ is an arithmetic sequence.

Ascending arithmetic sequence with step size of one:

```
>>> [1 2 3 4 5].isArithmeticProgression
true
```

Descending arithmetic sequence with step size of one:

```
>>> [7 6 5 4 3].isArithmeticProgression
true
```

The `differences` of an arithmetic sequence are all equal:

```
>>> let l = [1 3 5 7 9];
>>> (l.isArithmeticProgression, l.differences)
(true, [2 2 2 2])
```

* * *

See also: arithmeticProgression, asRange, isArithmeticProgressionBy, isGeometricProgression, Range

Categories: Testing

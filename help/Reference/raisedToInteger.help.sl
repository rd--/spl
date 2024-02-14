# raisedToInteger

_raisedToInteger(aNumber, anInteger)_

Special case of _^_ where the exponent is an integer.

```
>>> 1:9.collect { :each | 3.raisedToInteger(each) }
[3, 9, 27, 81, 243, 729, 2187, 6561, 19683]

>>> 1:9.collect { :each | 3 ^ each }
[3, 9, 27, 81, 243, 729, 2187, 6561, 19683]
```

Negative exponents:

```
>>> -1:-9.collect { :each | 3.raisedToInteger(each) }
[3, 9, 27, 81, 243, 729, 2187, 6561, 19683].reciprocal

>>> -1:-9.collect { :each | 3 ^ each }
[3, 9, 27, 81, 243, 729, 2187, 6561, 19683].reciprocal
```

* * *

See also: ^

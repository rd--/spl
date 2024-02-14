# raisedToInteger

_raisedToInteger(aNumber, anInteger)_

Special case of _^_ where the exponent is an integer.

An exponent of zero answers one of correct type:

```
>>> system.nextRandomFloat ^ 0
1.0

>>> 7/9 ^ 0
1/1

>>> 7j9 ^ 0
1j0
```

An exponent of one answers _aNumber_:

```
>>> let n = system.nextRandomFloat;
>>> n ^ 1
n

>>> 2j3 ^ 1
2j3
```

Three raised to integers one through nine:

```
>>> 1:9.collect { :each | 3.raisedToInteger(each) }
[3 9 27 81 243 729 2187 6561 19683]

>>> 1:9.collect { :each | 3 ^ each }
[3 9 27 81 243 729 2187 6561 19683]
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

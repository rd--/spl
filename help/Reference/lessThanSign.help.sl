# <

- _aMagnitude < anotherMagnitude_

Answers _true_ if _aMagnitude_ is comparable with and less than _anotherMagnitude_.

```
>>> 3 < 5
true

>>> 3.4 < 5.6
true

>>> 3/4 < 5/6
true

>>> '3' < '5'
true

>>> { 3j3 < 5j5 }.ifError { true }
true

>>> { '3' < 5 }.ifError { true }
true

>>> { 3 < '5' }.ifError { true }
true
```

The name of this operator is _lessThanSign_.

* * *

See also: >, Magnitude

Categories: Comparison operator

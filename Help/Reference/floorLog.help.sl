# floorLog

- _floorLog(n, b=10)_

Answer the `floor` of the `log` base _b_ of the number _n_.

At `Float`:

```
>>> 100.0.floorLog(10.0)
2L

>>> 100.0.log(10.0).floor
2L

>>> (1.0 / 100.0).floorLog(10.0)
-2L

>>> (1.0 / 100.0).log(10.0).floor
-2L
```

At `Integer`:

```
>>> (10L ^ 17L)
>>> .floorLog(10L)
17L
```

* * *

See also: floor, log, numberOfDigitsInBase

Guides: Integer Functions, Mathematical Functions

References:
_Smalltalk_
5.6.7.8

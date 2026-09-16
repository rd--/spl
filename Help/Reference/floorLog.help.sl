# floorLog

- _floorLog(n, b=10)_

Answer the `floor` of the `log` base _b_ of the number _n_.

At `SmallFloat`:

```
>>> 100.floorLog(10)
2

>>> 100.log(10).floor
2

>>> (1 / 100).floorLog(10)
-2

>>> (1 / 100).log(10).floor
-2
```

At `LargeInteger`:

```
>>> (10L ^ 17)
>>> .floorLog(10)
17
```

* * *

See also: floor, log

Guides: Mathematical Functions

References:
_Smalltalk_
5.6.7.8

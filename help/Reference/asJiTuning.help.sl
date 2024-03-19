# asJiTuning

- _asJiTuning(aList)_

Answer a `JiTuning` given a `List` of interval values.

If the intervals are `Fraction` values they are understood to be ratios and the first ratio should be 1/1:

```
>>> [1/1 8/7 4/3 14/9 16/9].asJiTuning.integers
[63 72 84 98 112]
```

If the intervals are `Integer` values they are understood to be integer pitches:

```
>>> [63 72 84 98 112].asJiTuning.ratios
[1/1 8/7 4/3 14/9 16/9]
```

* * *

See also: JiTuning

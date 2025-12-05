# truncateScale

- _truncateScale(d, s, f:/1)_

At `Decimal` _d_,
truncate the scale of the value to _s_,
which must be less than or equal to the scale of _d_.

Truncate from one-hundred decimal places to three:

```
>>> 1D100.truncateScale(3)
1.000D
```

Truncate from five decimal places to four:

```
>>> 3.14159D.truncateScale(4)
3.1415D
```

The mode of the truncation may be specified:

```
>>> 3.14159D.truncateScale(4, round:/1)
3.1416D
```

* * *

See also: Decimal, scale, truncate

Guides: Number Functions

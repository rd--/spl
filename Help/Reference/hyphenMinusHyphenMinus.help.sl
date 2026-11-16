# -- (hyphenMinusHyphenMinus)

- _a -- b_

Operator form of both `Interval` and `ComplexInterval`,
types representing closed intervals over real and complex numbers.

```
>>> 1.0 -- 9.0
Interval(1.0, 9.0)

>>> 1J1 -- 9J9
ComplexInterval(1J1, 9J9)
```

Threads over lists:

```
>>> [1 3 5] -- [4 5 6]
[1 -- 4, 3 -- 5, 5 -- 6]

>>> [1J1 3J3 5J5] -- [4J4 5J5 6J6]
[1J1 -- 4J4, 3J3 -- 5J5, 5J5 -- 6J6]
```

The name of this operator is `hyphenMinusHyphenMinus`.

Where supported `--` is displayed as —.

* * *

See also: ComplexInterval, Interval, Range, ->

Guides: Interval Functions

Unicode: U+2014 — Em Dash

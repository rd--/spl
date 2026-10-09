# -- (hyphenMinusHyphenMinus)

- _min -- max_

Operator form of `Interval`, a type representing a closed interval.

```
>>> 1 -- 9
Interval(1, 9)
```

Threads over lists:

```
>>> [1 3 5] -- [4 5 6]
[1 -- 4, 3 -- 5, 5 -- 6]
```

The name of this operator is `hyphenMinusHyphenMinus`.

Where supported `--` is displayed as —.

* * *

See also: Interval, Range, ->

Guides: Range Syntax

Unicode: U+2014 — Em Dash

Categories: Constructor, Number, Operator

# Documentation Tests

Documentation tests are written as any number of _>>>_ prefixed lines followed by one _answer_ line.

The tests must be written so that the _>>>_ prefixed lines,
when unprefixed and concatenated,
evaluate to a value that is _~_ to the answer line when placed in parentheses.

To show that real numbers are _commutative_ under addition and multiplication we can write:

```
>>> pi + e
e + pi

>>> pi * e
e * pi
```

The `terseReferenceSummary` method collects and runs all such tests and summarises the results.

Where supported the token `>>>` is displayed as ⋙.

* * *

Unicode: U+22D9 ⋙ Very Much Greater-Than

See also: Reference Help Files], terseReferenceSummary

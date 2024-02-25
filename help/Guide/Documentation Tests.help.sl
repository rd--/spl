# Documentation Tests

Documentation tests are written as any number of _>>>_ prefixed lines followed by one _answer_ line.

The tests are written so that the _>>>_ prefixed lines,
when unprefixed and concatenated,
evaluate to a value that is similar to the answer line when placed in parentheses,
as implemented by `~`.

To show that real numbers are commutative under addition and multiplication we can write:

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

See also: ~, Reference Help Files, terseReferenceSummary

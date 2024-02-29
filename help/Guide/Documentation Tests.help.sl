# Documentation Tests

Documentation tests are written as any number of _>>>_ prefixed _program_ lines,
followed by any number of unprefixed _answer_ lines.

The tests are written so that the _>>>_ prefixed lines,
when unprefixed and concatenated,
evaluate to a value that is similar to the answer lines when concatenated and placed in parentheses,
as implemented by `~`.

To show that real numbers are commutative under addition and multiplication we can write:

```
>>> pi + e
e + pi

>>> pi * e
e * pi
```

Multiple _program_ and _answer_ lines:

```
>>> let m = [3 2 4].iota;
>>> m + m / 2
[
	1 2 3 4; 5 6 7 8:;
	9 10 11 12; 13 14 15 16:;
	17 18 19 20; 21 22 23 24
]
```

Documentation tests are written in _Fenced Code Blocks_.

The `terseReferenceSummary` method collects and runs all such tests and summarises the results.

The `parseTerseDocumentTestBlocks` parses a documentation test block.

The `formatTerseDocumentTestEntry` method formats a parsed documenation test block for evaluation.

Where supported the token `>>>` is displayed as ⋙.

* * *

Unicode: U+22D9 ⋙ Very Much Greater-Than

See also: ~, Reference Help Files, terseReferenceSummary

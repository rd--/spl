# Documentation Tests

Documentation tests are written as any number of `>>>` prefixed _program_ lines,
followed by any number of unprefixed _expected answer_ lines,
ended by an empty line, or a _code fence_.

The tests are written so that the `>>>` prefixed lines,
when unprefixed and concatenated,
evaluate to a value that is similar to,
as implemented by `~`,
the answer lines when concatenated and placed in parentheses.

To show that real numbers are commutative under addition and multiplication we can write:

```
>>> pi + e
e + pi

>>> pi * e
e * pi
```

Multiple _program_ and _expected answer_ lines:

```
>>> let m = [3 2 4].iota;
>>> m + m / 2
[
	 1  2  3  4;  5  6  7  8:;
	 9 10 11 12; 13 14 15 16:;
	17 18 19 20; 21 22 23 24
]
```

Documentation tests are written in `Fenced Code Blocks`.

`terseReferenceSummary` collects and runs all such tests and summarises the results.

The `DocumentationTest` type holds a documentation test, and
`extractDocumentationTests` finds all documentation test blocks in a `List` of `String` items.

Where supported the token `>>>` is displayed as ⋙.

* * *

See also: ~, DocumentationTest, extractDocumentationTests, isCodeFence, terseReferenceSummary

Guides: Fenced Code Blocks, Reference Help Files

Unicode: U+22D9 ⋙ Very Much Greater-Than

Categories: Help

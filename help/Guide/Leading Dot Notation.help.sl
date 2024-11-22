# Leading Dot Notation

In cases where an expression of the form _p.q_ is placed over two lines,
the `.` is by convention placed at the beginning of the line (leading dot),
not the end (trailing dot).

```
>>> -9.abs.sqrt
3

>>> -9
>>> .abs
>>> .sqrt
3
```

Indentation follows the usual rules:

```
>>> -9.abs.max(9.cubed).sqrt
27

>>> -9
>>> .abs
>>> .max(
>>> 	9
>>> 	.cubed
>>> )
>>> .sqrt
27
```

_Rationale_:
In this notation,
the leading dot indicates that a line is a continuation of the preceding line.
The indentation level is retained,
the dot continues the expression at the level it is aligned with.

* * *

Guides: Indentation Rules

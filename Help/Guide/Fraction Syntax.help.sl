# Fraction Syntax

Rewrite rule:

- _n/d_ ⟹ _Fraction(nL, dL)_

```
>> '3/4'.splSimplify
Fraction(3L, 4L)
```

A `Fraction` is a number consisting of two integers, a numerator and a denominator.

Fractions may be written using the syntax _numerator/denominator_,
i.e. `3/4` or `2/3`.

```
>>> 3/4
Fraction(3, 4)

>>> 2/3
Fraction(2, 3)
```

Fraction literals allow underscores to be used as separators:

```
>> '123_456/456_789'.splSimplify
Fraction(123_456L, 456_789L)

>>> 123_456/456_789
123456/456789
```

Fraction syntax assume that infix operators are written using white-space separators,
however at present the parser does not require this.
The expression _x/y/z_ should be an error,
however it is currently parsed as _x/y / z_.

```
>>> 3/4 / 5
3/20

>>> 3 / 4/5
15/4
```

If the `Fraction` package is not installed,
the `SmallFloat` package can implement `Fraction` as `/`.

* * *

See also: Fraction

Guides: Number Syntax, Syntax Guides

# Complex Number Syntax

Rewrite rules:

- _aJb_ ⟹ _Complex(a, b)_
- _aI_ ⟹ _Complex(0, a)_

```
>> '3J4'.splSimplify
Complex(3, 4)

>> '3I'.splSimplify
Complex(0, 3)
```

A complex number is a number consisting of a _real_ and an _imaginary_ component.
There are two literal notations for complex numbers.

In the first,
complex numbers may be written using the syntax _aJb_,
i.e. `3J4` or `2.3J4.5`.

```
>>> 3J4
Complex(3, 4)

>>> 2.3J4.5
Complex(2.3, 4.5)
```

In the second,
a purely imaginary number may be written using the syntax _aI_.

```
>>> 3I
0J3

>>> 2.3I
0J2.3

>>> 2 + 3I
2J3
```

`j` is the name of a method:

```
>>> 3.j(4)
3J4

>>> 2.j(3)
2J3
```

`j` is equivalent to `Complex`:

```
>>> 3.Complex(4)
3J4
```

`i` is also the name of a method:

```
>>> 3.i
0J3

>>> 2 + 3.i
2J3
```

* * *

See also: Complex, i, j

Guides: Complex Number Functions, Number Syntax

References:
_Apl_
[1](https://aplwiki.com/wiki/Complex_number)

Categories: Syntax

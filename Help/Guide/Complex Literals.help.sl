# Complex Literals

A complex number is a number consisting of a _real_ and an _imaginary_ component.

Complex numbers may be written as literals using the syntax _rJi_,
i.e. `3J4` or `2J3`.

```
>>> 3J4
Complex(3, 4)

>>> 2J3
Complex(2, 3)
```

The rewrite rule is _rJi => Complex(r, i)_.

The _J_ may also be written _j_,
however Spl writes _J_ consistently.

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

* * *

See also: Complex, i, j

Guides: Complex Numbers, Number Literals

References:
_Apl_
[1](https://aplwiki.com/wiki/Complex_number)

Categories: Literals

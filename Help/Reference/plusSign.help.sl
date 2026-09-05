# + (plusSign)

- _m + n_
- _n.+_

The binary form is `plus`:

```
>>> 3 + 4
plus(3, 4)
```

The unary form is `conjugate`:

```
>>> 1J1.+
conjugate(1J1)
```

The name of this operator is `plusSign`:

```
>>> 'm + n'.splSimplify
'plusSign(m, n)'

>>> 'n.+'.splSimplify
'plusSign(n)'
```

`+` is also a syntax token, see `Defining Methods`.

* * *

See also: -, *, /, conjugate, plus, plusSign, sum

Guides: Binary Operators, Defining Methods

Unicode: U+002B + Plus Sign

Categories: Arithmetic, Math, Operator, Syntax

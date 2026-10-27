# + (plusSign)

- _m + n_

The binary form is `plus`:

```
>>> 3 + 4
plus(3, 4)
```

Sometimes the unary form is defined to be `conjugate`:

```
>>> let + = { :x | x.conjugate };
>>> 1J1.+
1J-1
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

See also: *, -, /, conjugate, plus, plusSign, sum

Guides: Binary Operators, Defining Methods

Unicode: U+002B + Plus Sign

Categories: Arithmetic, Math, Operator, Syntax

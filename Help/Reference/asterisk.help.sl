# * (asterisk)

- _m * n_
- _n.*_

The binary case is the operator form of `times`:

```
>>> 3 * 4
times(3, 4)
```

The unary case is sometimes defined to be the operator form of `sign`:

```
>>> let * = { :x | x.sign };
>>> -3.*
-1
```

Where supported `*` is displayed as ×.

The name of this operator is `asterisk`:

```
>>> 'm * n'.splSimplify
'asterisk(m, n)'

>>> 'n.*'.splSimplify
'asterisk(n)'
```

* * *

See also: +, -, /, ^, *+, asterisk, sign, times

Guides: Binary Operators

Unicode:
U+00D7 × Multiplication Sign,
U+22C6 ⋆ Star Operator

Categories: Math, Operator

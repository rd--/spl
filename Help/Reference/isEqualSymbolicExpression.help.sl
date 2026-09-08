# isEqualSymbolicExpression

- _isEqualSymbolicExpression(x, y)_

`=` at `SymbolicExpression` answers a `SymbolicExpression`, not a `Boolean`.
`isEqualSymbolicExpression` answers a `Boolean`.

At `Symbol`:

```
>>> `x`.isEqualSymbolicExpression(`x`)
true

>>> `*`.isEqualSymbolicExpression(`+`)
false

>>> `*`.isEqualSymbolicExpression(3.141)
false

>>> `x`.isEqualSymbolicExpression(`x` + 1)
false
```

At `SmallFloat`:

```
>>> 3.141.isEqualSymbolicExpression(`x`)
false
```

At `SymbolicExpression`:

```
>>> (`x` + 1).isEqualSymbolicExpression(`x`)
false

>>> (`x` * `x`).isEqualSymbolicExpression(`x` + `x`)
false

>>> (`x` * `x`).isEqualSymbolicExpression(`x` * `x`)
true

>>> (`x` + 1).isEqualSymbolicExpression(`x` + `y`)
false
```

* * *

See also: =, ==, SmallFloat, Symbol, SymbolicExpression

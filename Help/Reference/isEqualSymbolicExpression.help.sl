# isEqualSymbolicExpression

- _isEqualSymbolicExpression(anObject, anotherObject)_

`=` at `SymbolicExpression` answers a `SymbolicExpression`, not a `Boolean`.
`isEqualSymbolicExpression` answers a `Boolean`.

At `Symbol`:

```
>>> 𝒙.isEqualSymbolicExpression(𝒙)
true

>>> `*`.isEqualSymbolicExpression(`+`)
false

>>> `*`.isEqualSymbolicExpression(3.141)
false

>>> 𝒙.isEqualSymbolicExpression(𝒙 + 1)
false
```

At `SmallFloat`:

```
>>> 3.141.isEqualSymbolicExpression(𝒙)
false
```

At `SymbolicExpression`:

```
>>> (𝒙 + 1).isEqualSymbolicExpression(𝒙)
false

>>> (𝒙 * 𝒙).isEqualSymbolicExpression(𝒙 + 𝒙)
false

>>> (𝒙 * 𝒙).isEqualSymbolicExpression(𝒙 * 𝒙)
true

>>> (𝒙 + 1).isEqualSymbolicExpression(𝒙 + 𝒚)
false
```

* * *

See also: =, ==, SmallFloat, Symbol, SymbolicExpression

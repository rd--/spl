# asSymbolicExpression

- _asSymbolicExpression(aBlock, aList)_

Apply _aBlock_ to symbols with names specified in _aList_.

At one argument `Block`:

```
>>> { :x |
>>> 	x / 3 ^ 2
>>> }.asSymbolicExpression(['x'])
'x'.Symbol / 3 ^ 2
```

At two argument `Block`,
with unicode symbols:

```
>>> { :x :y |
>>> 	(2 * x) + (3 * y)
>>> }.asSymbolicExpression(['α' 'β'])
(2 * 'α'.Symbol) + (3 * 'β'.Symbol)
```

If the symbol names are elided the letters of the greek alphabet are used:

```
>>> Hypot:/2
>>> .asSymbolicExpression
>>> .printString
'(sqrt (+ (* α α) (* β β)))'
```

* * *

See also: Block, printString, Symbol, SymbolicExpression

Categories: Logic

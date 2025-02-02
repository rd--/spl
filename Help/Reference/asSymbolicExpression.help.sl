# asSymbolicExpression

- _asSymbolicExpression(aBlock, aList)_

Apply _aBlock_ to symbols with names specified in _aList_.

At one argument `Block`:

```
>>> { :x |
>>> 	x / 3 ^ 2
>>> }.asSymbolicExpression(['x'])
>>> .printString
'(^ (/ x 3) 2)'
```

At two argument `Block`,
with unicode symbols:

```
>>> { :x :y |
>>> 	(2 * x) + (3 * y)
>>> }.asSymbolicExpression(['α' 'β'])
>>> .printString
'(+ (* 2 α) (* 3 β))'
```

If the symbol names are elided the letters of the greek alphabet are used:

```
>>> Hypotenuse:/2
>>> .asSymbolicExpression
>>> .printString
'(sqrt (+ (* α α) (* β β)))'
```

```
>>> { :x :y |
>>> 	(
>>> 		(x.abs < 0.01) | {
>>> 			y.abs < 0.01
>>> 		}
>>> 	).if {
>>> 		1
>>> 	} {
>>> 		0
>>> 	}
>>> }.asSymbolicExpression.printString
'(if (or (< (abs α) 0.01) (< (abs β) 0.01)) 1 0)'
```

* * *

See also: Block, printString, Symbol, SymbolicExpression

Categories: Logic

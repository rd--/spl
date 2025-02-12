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

A function that is `one` if either _x_ or _y_ are close to `zero`:

```
>>> { :x :y |
>>> 	(
>>> 		(x ~ 0) | {
>>> 			y.abs ~ 0
>>> 		}
>>> 	).if {
>>> 		1
>>> 	} {
>>> 		0
>>> 	}
>>> }.asSymbolicExpression.printString
'(if (or (~ α 0) (~ β 0)) 1 0)'
```

* * *

See also: Block, printString, Symbol, SymbolicExpression

Categories: Logic

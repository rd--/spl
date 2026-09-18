# asSymbolicExpression

- _asSymbolicExpression(f, [x₁ x₂ …])_

Apply the block _f_ to symbols with names specified in the list _x_.

At one argument `Block`:

```
>> { :x |
>> 	x / 3 ^ 2
>> }.asSymbolicExpression(['x'])
(^ (/ x 3) 2)
```

At two argument `Block`,
with unicode symbols:

```
>> { :x :y |
>> 	(2 * x) + (3 * y)
>> }.asSymbolicExpression(['α' 'β'])
(+ (* 2 α) (* 3 β))
```

If the symbol names are elided the letters of the greek alphabet are used:

```
>> Hypotenuse/2
>> .asSymbolicExpression
(sqrt (+ (* α α) (* β β)))
```

A function that is `one` if either _x_ or _y_ are close to `zero`:

```
>> { :x :y |
>> 	(
>> 		(x ~ 0) | {
>> 			y ~ 0
>> 		}
>> 	).if {
>> 		1
>> 	} {
>> 		0
>> 	}
>> }.asSymbolicExpression
(if (or (~ α 0) (~ β 0)) 1 0)
```

* * *

See also: Block, Symbol, SymbolicExpression

Categories: Logic

# SymbolicExpression

- _SymbolicExpression(operator, operands)_

A `Type` representing a symbolic expression.
The `printString` of a symbolic expression is an _S-expression_.

`SymbolicExpression` implements `=` and `~` symbolically:

```
>>> (`x` = `y`).isSymbolicExpression
true

>>> (`x` = `y`).isSymbolicExpression
true

>>> (`x` + `y`).typeOf
'SymbolicExpression'
```

`operator` answers the operator of the expression.
The `operator` is retained as the `unqualifiedName` of the `Block`:

```
>>> (`x` = `y`).operator.isSymbol
true

>>> (`x` = `y`).operator.name
'='

>>> min(`x`, `y`).operator.name
'min'
```

Symbolic predicates:

```
>> `x` = `y`
(= x y)

>> `x` ~ `y`
(~ x y)

>> `x` / 2 ~ 0
(~ (/ x 2) 0)

>> 3 / `x`
(/ 3 x)
```

`isEqualSymbolicExpression` tests if two `SymbolicExpression` values are the same:

```
>>> let a = `x` + 3.141;
>>> let b = `y` * 1.618;
>>> { :i :j |
>>> 	i.isEqualSymbolicExpression(j)
>>> }.table([a, b], [a, b])
[true false; false true]
```

Symbolic expressions implement `adaptToNumberAndApply`:

```
>> `x` + 23
(+ x 23)

>> 3.141 / `x`
(/ 3.141 x)

>> (`x` ^ 2) + (`x` ^ 3)
(+ (^ x 2) (^ x 3))
```

Symbolic primitives thread over lists:

```
>> (`x` * [2 3] + [4 5])
[(+ (* x 2) 4), (+ (* x 3) 5)]
```

When printing symbolic expressions,
certain constant numbers are recognised as symbolic expressions:

```
>> `x` * 2.pi
(* x (* 2 π))
```

Symbolic expressions implement `Number`.
`square` multiplies a number by itself:

```
>> (23 - `x`).square
(* (- 23 x) (- 23 x))
```

`Hypotenuse` is the `sqrt` of the sum of the squares:

```
>> `x`.Hypotenuse(`y`)
(sqrt (+ (* x x) (* y y)))
```

The operator need not be a `Symbol`,
is may also be a `SymbolicExpression`:

```
>> SymbolicExpression(
>> 	SymbolicExpression(
>> 		'f',
>> 		[`x`]
>> 	),
>> 	[`y`]
>> )
((f x) y)
```

Evaluate `inner` using symbolic primitives:

```
>>> let f = '*'.symbolicBinaryPrimitive;
>>> let g = '+'.symbolicBinaryPrimitive;
>>> [
>>> 	f.inner([1 2], [3 4], g),
>>> 	f.inner([1 2; 3 4], [8 9], g),
>>> 	f.inner([9 8], [1 2; 3 4], g),
>>> 	f.inner([1 2; 3 4], [6 7; 8 9], g)
>>> ].deepCollect(printString:/1)
[
	'(+ (* 1 3) (* 2 4))',
	 [
		 '(+ (* 1 8) (* 2 9))',
		 '(+ (* 3 8) (* 4 9))'
	 ],
	 [
		 '(+ (* 9 1) (* 8 3))',
		 '(+ (* 9 2) (* 8 4))'
	 ],
	 [
		 [
			 '(+ (* 1 6) (* 2 8))',
			 '(+ (* 1 7) (* 2 9))'
		 ],
		 [
			 '(+ (* 3 6) (* 4 8))',
			 '(+ (* 3 7) (* 4 9))'
		 ]
	 ]
]
```

`SymbolicExpression` implements `Iterable`,
`contents` answers the expression and each of its parts in a left-biased pre-order traversal:

```
>> (`x` * `y` + `𝒛`).contents
[(+ (* x y) z), +, (* x y), *, x, y, z]
```

List common subexpressions:

```
>> let a = `x` * `x`;
>> (a * a).commonSubexpressions(==)
[(* x x)]
```

Simplify constant math operations:

```
>> `x` + 0
x

>> 0 + `x`
x

>> `x` - 0
x

>> `x` * 1
x

>> 1 * `x`
x

>> `x` / 1
x
```

Plot the `Graph` of the `Tree` of a `SymbolicExpression`:

~~~spl svg=A
`x`.Hypotenuse(`y`).asTree.treePlot
~~~

![](Help/Image/SymbolicExpression-A.svg)

* * *

See also: asSymbolicExpression, isEqualSymbolicExpression, commonSubexpressions, name, printString, recogniseSymbolicExpression, Symbol

Categories: Logic, Type

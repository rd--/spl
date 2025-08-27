# SymbolicExpression

- _SymbolicExpression(operator, operands)_

A `Type` representing a symbolic expression.
The `printString` of a symbolic expression is an _S-expression_.

`SymbolicExpression` implements `=` and `~` symbolically:

```
>>> (𝒙 = 𝒚).isSymbolicExpression
true

>>> (𝒙 = 𝒚).isSymbolicExpression
true

>>> (𝒙 + 𝒚).typeOf
'SymbolicExpression'
```

`operator` answers the operator of the expression.
The `operator` is retained as the `unqualifiedName` of the `Block`:

```
>>> (𝒙 = 𝒚).operator.isSymbol
true

>>> (𝒙 = 𝒚).operator.name
'='

>>> min(𝒙, 𝒚).operator.name
'min'
```

Symbolic predicates:

```
>> 𝒙 = 𝒚
(= x y)

>> 𝒙 ~ 𝒚
(~ x y)

>> 𝒙 / 2 ~ 0
(~ (/ x 2) 0)

>> 3 / 𝒙
(/ 3 x)
```

`isEqualSymbolicExpression` tests if two `SymbolicExpression` values are the same:

```
>>> let a = 𝒙 + 3.141;
>>> let b = 𝒚 * 1.618;
>>> { :i :j |
>>> 	i.isEqualSymbolicExpression(j)
>>> }.table([a, b], [a, b])
[true false; false true]
```

Symbolic expressions implement `adaptToNumberAndApply`:

```
>> 𝒙 + 23
(+ x 23)

>> 3.141 / 𝒙
(/ 3.141 x)

>> (𝒙 ^ 2) + (𝒙 ^ 3)
(+ (^ x 2) (^ x 3))
```

Symbolic primitives thread over lists:

```
>> (𝒙 * [2 3] + [4 5])
[(+ (* x 2) 4), (+ (* x 3) 5)]
```

When printing symbolic expressions,
certain constant numbers are recognised as symbolic expressions:

```
>> 𝒙 * 2.pi
(* x (* 2 π))
```

Symbolic expressions implement `Number`.
`square` multiplies a number by itself:

```
>> (23 - 𝒙).square
(* (- 23 x) (- 23 x))
```

`Hypotenuse` is the `sqrt` of the sum of the squares:

```
>> 𝒙.Hypotenuse(𝒚)
(sqrt (+ (* x x) (* y y)))
```

The operator need not be a `Symbol`,
is may also be a `SymbolicExpression`:

```
>> SymbolicExpression(
>> 	SymbolicExpression(
>> 		'f',
>> 		[𝒙]
>> 	),
>> 	[𝒚]
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
>> (𝒙 * 𝒚 + 𝒛).contents
[(+ (* x y) z), +, (* x y), *, x, y, z]
```

List common subexpressions:

```
>> let a = 𝒙 * 𝒙;
>> (a * a).commonSubexpressions(==)
[(* x x)]
```

Plot the `Graph` of the `Tree` of a `SymbolicExpression`:

~~~spl svg=A
𝒙.Hypotenuse(𝒚).asTree.treePlot
~~~

![](sw/spl/Help/Image/SymbolicExpression-A.svg)

* * *

See also: asSymbolicExpression, isEqualSymbolicExpression, commonSubexpressions, name, printString, recogniseSymbolicExpression, Symbol

Categories: Logic, Type

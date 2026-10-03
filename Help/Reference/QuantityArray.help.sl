# QuantityArray

- _QuantityArray(m, u)_

A `Type` representing an array of quantities with magnitudes _m_ and units _u_.

A `List` of lengths, all given in meters:

```
>>> let q = QuantityArray(
>>> 	[2.3 1.5 9.0],
>>> 	'metre'
>>> );
>>> (
>>> 	q.magnitudeArray,
>>> 	q.unitList,
>>> 	q.normal
>>> )
(
	[2.3 1.5 9.0],
	['metre' 'metre' 'metre'],
	[
		Quantity(2.3, 'metre'),
		Quantity(1.5, 'metre'),
		Quantity(9.0, 'metre')
	]
)
```

A list of pairs _(time, length)_:

```
>>> let q = QuantityArray(
>>> 	[1.4 2.3; 2.8 2.7; 4.2 3.5],
>>> 	['second' 'metre']
>>> );
>>> (
>>> 	q.magnitudeArray,
>>> 	q.unitList,
>>> 	q.normal
>>> )
(
	[1.4 2.3; 2.8 2.7; 4.2 3.5],
	['second' 'metre'],
	[
		[
			Quantity(1.4, 'second'),
			Quantity(2.3, 'metre')
		],
		[
			Quantity(2.8, 'second'),
			Quantity(2.7, 'metre')
		],
		[
			Quantity(4.2, 'second'),
			Quantity(3.5, 'metre')
		]
	]
)
```

* * *

See also: Quantity

Guides: Quantity Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/QuantityArray.html)

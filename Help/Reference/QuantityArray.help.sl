# QuantityArray

- _QuantityArray(m, u)_

A `Type` representing an array of quantities with magnitudes _m_ and units _u_.

A `List` of lengths, all given in meters:

```
>>> let q = QuantityArray(
>>> 	[2.3 1.5 9.0],
>>> 	'metres'
>>> );
>>> (
>>> 	q.magnitudeArray,
>>> 	q.unitList,
>>> 	q.normal
>>> )
(
	[2.3 1.5 9.0],
	['metres' 'metres' 'metres'],
	[
		Quantity(2.3, 'metres'),
		Quantity(1.5, 'metres'),
		Quantity(9.0, 'metres')
	]
)
```

A list of pairs _(time, length)_:

```
>>> let q = QuantityArray(
>>> 	[1.4 2.3; 2.8 2.7; 4.2 3.5],
>>> 	['seconds' 'meters']
>>> );
>>> (
>>> 	q.magnitudeArray,
>>> 	q.unitList,
>>> 	q.normal
>>> )
(
	[1.4 2.3; 2.8 2.7; 4.2 3.5],
	['seconds' 'meters'],
	[
		[
			Quantity(1.4, 'seconds'),
			Quantity(2.3, 'meters')
		],
		[
			Quantity(2.8, 'seconds'),
			Quantity(2.7, 'meters')
		],
		[
			Quantity(4.2, 'seconds'),
			Quantity(3.5, 'meters')
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

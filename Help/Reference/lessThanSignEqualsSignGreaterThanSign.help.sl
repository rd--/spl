# <=> (lessThanSignEqualsSign...)

- _p <=> q_

Answers a collation order of -1, 0, or 1,
indicating whether the left operand _p_ should be collated
before, equal to, or after the right operand _q_.

Implemented for numbers and strings.

Ascending:

```
>>> 1 + 1 <=> 3
-1

>>> (7 / 3).gamma <=> 2.sqrt
-1

>>> 'abc' <=> 'bcd'
-1

>>> '-0' <=> '-2'
-1
```

Equal to:

```
>>> 1 + 1 <=> 2
0

>>> 2.pi / 2 <=> 1.pi
0

>>> 'abc' <=> 'abc'
0
```

Descending:

```
>>> 3 <=> 1
1

>>> 1.e ^ 2 <=> 1.pi
1

>>> 'bcd' <=> 'abc'
1
```

Mixed numeric types, ascending and descending:

```
>>> 1 <=> 3/2
-1

>>> 3/2 <=> 1
1
```

Mixed numeric types, equal to:

```
>>> 1.5 <=> 3/2
0
```

-∞ comes before any real-valued expression:

```
>>> -1.inf <=> 1.goldenRatio
-1
```

∞ comes after any real-valued expression:

```
>>> 1E53 <=> 1.inf
-1
```

Comparison of strings with equal base letters and different marks:

```
>>> 'réservé' <=> 'reserve'
1
```

Find which tuples are in order:

```
>>> [0 1 2].tuples(2).collect { :each |
>>> 	let [i, j] = each;
>>> 	i <=> j
>>> }
[0 -1 -1 1 0 -1 1 1 0]
```

The name of this operator is `lessThanSignEqualsSignGreaterThanSign`.

* * *

See also: ~, =, <, <=, >, >=, compare

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NumericalOrder.html)

Categories: Comparing

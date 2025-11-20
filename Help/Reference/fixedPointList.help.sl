# fixedPointList

- _fixedPointList(f:/1, x, =)_

Generates a `List` giving the results of applying the unary block _f_ repeatedly,
starting with the object _x_,
until the results no longer change according to equality block _=_.

Find the sequence of values leading to a fixed point:

```
>>> { :x |
>>> 	1 + (x / 2).floor
>>> }.fixedPointList(1000, =)
[1000 501 251 126 64 33 17 9 5 3 2 2]
```

Repeated application of a rule until the result no longer changes:

```
>>> { :x |
>>> 	let [a, b] = x;
>>> 	(b != 0).if {
>>> 		[b, a % b]
>>> 	} {
>>> 		[a, b]
>>> 	}
>>> }.fixedPointList([28 21])
[28 21; 21 7; 7 0; 7 0]

>>> 28.gcd(21)
7
```

Show convergence to `2.sqrt` in Newton’s method:

```
>>> { :x |
>>> 	(x + (2 / x)) / 2
>>> }.fixedPointList(1, ~)
[1 1.5 1.41666 1.41422 1.41421]
```

Convergence may fail due to oscillations in the final digits.
Use a test function with a specific tolerance to resolve this:

```
>>> cos:/1.fixedPointList(0.5, ~).size
24

>>> cos:/1.fixedPointList(0.5) { :alpha :beta |
>>> 	(alpha - beta).abs < 0.1
>>> }
[0.5 0.8775 0.6390 0.8027 0.6948 0.7682]
```

* * *

See also: fixedPoint, nestList, nestWhileList

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FixedPoint.html)
[2](https://reference.wolfram.com/language/ref/FixedPointList.html)

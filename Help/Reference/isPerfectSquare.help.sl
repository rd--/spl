# isPerfectSquare

- _isPerfectSquare(n)_

Answer `true` if the integer _n_ is a perfect square.

A perfect square is an `Integer` that is the square of an integer.

The first few perfect squares,
OEIS [A000290](https://oeis.org/A000290):

```
>>> 0:200.select(isPerfectSquare:/1)
[
	0 1 4 9 16 25 36 49 64 81
	100 121 144 169 196
]
```

Plot `max` of `min` of all summands of _n_,
OEIS [A046805](https://oeis.org/A046805):

~~~spl svg=A
let f = { :n |
	(n = 0).if {
		Infinity
	} {
		n.isPerfectSquare.if {
			n.sqrt
		} {
			let a = n.sqrt.floor;
			let u = 1;
			{
				a > u
			}.whileTrue {
				let b = a;
				{
					b <= (n / a)
				}.whileTrue {
					let v = a.min(
						f(n - (a * b))
					);
					u := u.max(v);
					b := b + 1
				};
				a := a - 1
			};
			u
		}
	}
};
1:115.collect(f:/1).scatterPlot
~~~

![](sw/spl/Help/Image/isPerfectSquare-A.svg)

* * *

See also: square, sqrt

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PerfectSquare.html),
_OEIS_
[1](https://oeis.org/A000290),
_W_
[1](https://en.wikipedia.org/wiki/Square_number)

Categories: Testing, Math

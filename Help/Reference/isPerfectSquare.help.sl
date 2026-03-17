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

`max` of `min` of all summands of _n_,
OEIS [A046805](https://oeis.org/A046805):

~~~spl svg=A oeis=A046805
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

![](Help/Image/isPerfectSquare-A.svg)

The characteristic function of the square numbers,
OEIS [A010052](https://oeis.org/A010052):

~~~spl svg=B oeis=A010052
0:81.collect(isPerfectSquare:/1)
.boole
.discretePlot
~~~

![](Help/Image/isPerfectSquare-B.svg)

Smallest _k_ such that the concatenation of _n_ and _k_ is a square,
OEIS [A071176](https://oeis.org/A071176):

~~~spl svg=C oeis=A071176
1:150.collect { :n |
	let d = n.integerDigits;
	let k = 0;
	{
		(d ++ k.integerDigits)
		.fromDigits
		.isPerfectSquare
	}.whileFalse {
		k := k + 1
	};
	k
}.scatterPlot
~~~

![](Help/Image/isPerfectSquare-C.svg)

The least integer, absolutely, not yet in the sequence such that the _|a(n-1)-a(n)|_ is a square,
OEIS [A377091](https://oeis.org/A377091):

~~~spl svg=D oeis=A377091
let m = 85;
let s = IdentitySet([0]);
{ :x |
	let a = 1:Infinity.detect { :i |
		s.includes(i).not | {
			s.includes(-i).not
		}
	};
	{
		s.includes(a) | {
			(x - a).abs
			.isPerfectSquare
			.not
		}
	}.whileTrue {
		a := (a < 0).boole - a
	};
	s.add(a);
	a
}.nestList(0, m).discretePlot
~~~

![](Help/Image/isPerfectSquare-D.svg)

Expansion of Jacobi theta function _θ4(x)_,
OEIS [A002448](https://oeis.org/A002448):

~~~spl svg=E oeis=A002448
0:500.collect { :n |
	let q = n.isPerfectSquare.boole;
	(-1 ^ n) * q * 2 - (n = 0).boole
}.discretePlot
~~~

![](Help/Image/isPerfectSquare-E.svg)

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

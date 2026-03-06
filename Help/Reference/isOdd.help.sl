# isOdd

- _isOdd(n)_

Answer `true` if the number _n_ is an odd integer, else `false`.

Test whether integers are odd:

```
>>> 5.isOdd
true

>>> 8.isOdd
false

>>> 1:5.collect(isOdd:/1)
[true false true false true]
```

At `zero`:

```
>>> 0.isOdd
false
```

Non-integers are never odd:

```
>>> 1.pi.isOdd
false
```

An odd number modulo two is one:

```
>>> [1 3 5 7 9] % 2
[1 1 1 1 1]
```

The sum or difference of two integers with unequal parity is odd:

```
>>> (13 - 4).isOdd
true

>>> (14 + 27).isOdd
true
```

The product of two odd integers is odd:

```
>>> (13 * 27).isOdd
true
```

The sums of the first odd integers, beginning with one, are perfect squares:

```
>>> 1:19.select(isOdd:/1).prefixSum
[1 4 9 16 25 36 49 64 81 100]
```

Either _n_ or _2n_,
[A022998](https://oeis.org/A022998):

```
>>> 0:23.collect { :n |
>>> 	n.isOdd.if { n } { 2 * n }
>>> }
[
	 0  1  4  3  8  5 12  7 16  9
	20 11 24 13 28 15 32 17 36 19
	40 21 44 23
]
```

Alternately add and multiply,
OEIS [A039941](https://oeis.org/A039941):

```
>>> let a = { :n |
>>> 	(n < 2).if {
>>> 		(n > 0).boole
>>> 	} {
>>> 		n.isOdd.if {
>>> 			a(n - 1) * a(n - 2)
>>> 		} {
>>> 			a(n-1) + a(n-2)
>>> 		}
>>> 	}
>>> };
>>> 0:12.collect(a:/1)
[0 1 1 1 2 2 4 8 12 96 108 10368 10476]
```

Plot OEIS [A065620](https://oeis.org/A065620):

~~~spl svg=A
let a = { :n |
	(n = 0).if {
		0
	} {
		n.isOdd.if {
			1 - (2 * a((n - 1) / 2))
		} {
			2 * a(n / 2)
		}
	}
};
0:150.collect(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/isOdd-A.svg)

Plot fixed point of dividing the digits according to parity and adding the parts,
OEIS [A059717](https://oeis.org/A059717):

~~~spl svg=B
0:250.collect { :i |
	{ :n |
		let d = n.integerDigits;
		let e = d.select(isEven:/1);
		let o = d.select(isOdd:/1);
		(o.size.min(e.size) > 0).if {
			o.fromDigits + e.fromDigits
		} {
			n
		}
	}.fixedPoint(i)
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/isOdd-B.svg)

Ordered set with zero and where if _x_ is in then both _2x+1_ and _4x_ are also in,
OEIS [A060142](https://oeis.org/A060142):

~~~spl svg=C
let a:/1 = { :n |
	(n < 3).if {
		(n < 2)
	} {
		n.isOdd.if {
			a(n // 2)
		} {
			n % 4 = 0 & {
				a(n / 4)
			}
		}
	}
}.memoize(true);
0:300.select(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/isOdd-C.svg)

Sum of the coefficients of the terms with an even exponent in the Stern polynomial _B(n+1,t)_,
OEIS [A000360](https://oeis.org/A000360)

~~~spl svg=D
let a = Map { :n |
	(n = 0).if {
		1
	} {
		n.isOdd.if {
			let m = (n - 1) / 2 - 1 % 3;
			a[(n - 1) / 2] - m + 1
		} {
			a[n / 2] + a[n / 2 - 1]
		}
	}
};
a[0:200].scatterPlot
~~~

![](sw/spl/Help/Image/isOdd-D.svg)

* * *

See also: divisible, isEven, isInteger

Guides: Integer Functions, Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/OddNumber.html)
[2](https://mathworld.wolfram.com/GnomonicNumber.html)
[3](https://mathworld.wolfram.com/Parity.html)
[4](https://reference.wolfram.com/language/ref/OddQ.html),
_OEIS_
[1](https://oeis.org/A005408),
_Smalltalk_
5.6.5.16,
_W_
[1](https://en.wikipedia.org/wiki/Odd_number)

Categories: Testing, Math

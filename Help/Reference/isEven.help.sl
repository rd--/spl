# isEven

- _isEven(n)_

Answer `true` if the number _n_ is an even integer, else `false`.

Test whether integers are even:

```
>>> 8.isEven
true

>>> 5.isEven
false

>>> 1:5.collect(isEven:/1)
[false true false true false]

>>> 1:5.allSatisfy(isEven:/1)
false
```

At `zero`:

```
>>> 0.isEven
true
```

An even number is divisible by two,
the modulo of an even number and two is zero:

```
>>> [2 4 6 8] % 2
[0 0 0 0]
```

The sum or difference of two integers with equal parity is even:

```
>>> (13 - 7).isEven
true

>>> (14 + 28).isEven
true
```

The product of two integers is even if either or both is even:

```
>>> (13 * 28).isEven
true

>>> (4 * 12).isEven
true
```

Non-integers are never even:

```
>>> 1.pi.isEven
false

>>> 1/2.isEven
false
```

The nonnegative even numbers,
Messiaen’s first mode of limited transposition,
OEIS [A005843](https://oeis.org/A005843):

```
>>> 0:25.select(isEven:/1)
[0 2 4 6 8 10 12 14 16 18 20 22 24]

>>> [0, 2 .. 24]
[0 2 4 6 8 10 12 14 16 18 20 22 24]
```

At `LargeInteger`:

```
>>> 3L.isEven
false

>>> 1234567890L.isEven
true
```

Either _n_ or _2n_,
[A109043](https://oeis.org/A109043):

```
>>> 0:23.collect { :n |
>>> 	n.isEven.if { n } { 2 * n }
>>> }
[
	 0  2  2  6  4 10  6 14  8 18
	10 22 12 26 14 30 16 34 18 38
	20 42 22 46
]
```

If _n_ is even then zero else _n_,
OEIS [A193356](https://oeis.org/A193356):

```
>>> 1:18.collect { :n |
>>> 	n.isEven.if { 0 } { n }
>>> }
[1 0 3 0 5 0 7 0 9 0 11 0 13 0 15 0 17 0]

>>> 1:17:2.riffle(0)
[1 0 3 0 5 0 7 0 9 0 11 0 13 0 15 0 17]
```

If _n_ is even then _n_ else zero,
OEIS [A237420](https://oeis.org/A237420):

```
>>> 0:18.collect { :n |
>>> 	n.isEven.if { n } { 0 }
>>> }
[0 0 2 0 4 0 6 0 8 0 10 0 12 0 14 0 16 0 18]

>>> [0 2 0 -1].linearRecurrence([0 0 2 0], 19)
[0 0 2 0 4 0 6 0 8 0 10 0 12 0 14 0 16 0 18]

>>> 0:18:2.riffle(0)
[0 0 2 0 4 0 6 0 8 0 10 0 12 0 14 0 16 0 18]
```

Log plot of the semi-Fibonacci sequence,
OEIS [A030067](https://oeis.org/A030067):

~~~spl svg=A oeis=A030067
let a = Map { :n |
	(n = 1).if {
		1
	} {
		n.isEven.if {
			a[n / 2]
		} {
			a[n - 1] + a[n - 2]
		}
	}
};
a[1:125].scatterPlot.log
~~~

![](Help/Image/isEven-A.svg)

_a(2n)=-2*a(n)_ and _a(2n+1)=2*a(n)-1_,
OEIS [A104895](https://oeis.org/A104895):

~~~spl svg=B oeis=A104895
let a = Map { :n |
	(n = 0).if {
		0
	} {
		n.isEven.if {
			2 * a[n / 2]
		} {
			-2 * a[(n - 1) / 2] - 1
		}
	}
};
a[0:150].scatterPlot
~~~

![](Help/Image/isEven-B.svg)

Fixed point of dividing the digits according to parity and multiplying the parts,
OEIS [A059707](https://oeis.org/A059707):

~~~spl svg=C oeis=A059707
0:250.collect { :i |
	{ :n |
		let d = n.integerDigits;
		let e = d.select(isEven:/1);
		let o = d.select(isOdd:/1);
		(o.size.min(e.size) > 0).if {
			o.fromDigits * e.fromDigits
		} {
			n
		}
	}.fixedPoint(i)
}.scatterPlot.log
~~~

![](Help/Image/isEven-C.svg)

The main diagonal of Kimberling’s expulsion array
OEIS [A007063](https://oeis.org/A007063):

~~~spl svg=D oeis=A007063
let k = { :i :j |
	(j < (2 * i - 3)).if {
		j.isEven.if {
			k(i - 1, i - (j / 2) - 1)
		} {
			k(i - 1, i + ((j - 1) / 2))
		}
	} {
		i + j - 1
	}
};
1:200.collect { :n |
	k(n, n)
}.scatterPlot
~~~

![](Help/Image/isEven-D.svg)

Hermite’s problem,
OEIS [A069981](https://oeis.org/A069981):

~~~spl svg=E oeis=A069981
1:35.collect { :n |
	n.isEven.if {
		((n + 8) * (n - 2)) / 8
	} {
		(n ^ 2 - 1) / 8
	}
}.stepPlot
~~~

![](Help/Image/isEven-E.svg)

Alcuin’s sequence,
OEIS [A005044](https://oeis.org/A005044):

~~~spl svg=F oeis=A005044
1:35.collect { :n |
	n.isEven.if {
		n ^ 2
	} {
		((n + 3) ^ 2)
	} / 48
}.round.stepPlot
~~~

![](Help/Image/isEven-F.svg)

A permutation of the positive integers,
OEIS [A163511](https://oeis.org/A163511):

~~~spl svg=G oeis=A163511 permutation
let f:/1 = 'A003961'.oeisFunction;
let a = Map { :n |
	(n <= 1).if {
		n + 1
	} {
		n.isEven.if {
			2 * a[n / 2]
		} {
			f(a[n - 1 / 2])
		}
	}
};
a[0:250].scatterPlot.log
~~~

![](Help/Image/isEven-G.svg)

Least positive integers whose convolution forms a sequence whose odd-indexed terms are twice the odd primes,
OEIS [A073739](https://oeis.org/A073739):

~~~spl svg=H oeis=A073739
let a = Map { :n |
	(n <= 2).if {
		1
	} {
		n.isEven.if {
			0
		} {
			let m = n + 1;
			(m / 2).prime - a[n - 2]
		}
	}
};
a[0:150].scatterPlot
~~~

![](Help/Image/isEven-H.svg)

Self convolution of
OEIS [A073739](https://oeis.org/A073739),
OEIS [A073740](https://oeis.org/A073740):

~~~spl svg=I oeis=A073740
let b = Map { :n |
	(n <= 2).if {
		1
	} {
		n.isEven.if {
			0
		} {
			let m = n + 1;
			(m / 2).prime - b[n - 2]
		}
	}
};
let a = Map { :n |
	(n <= 2).if {
		n + 1
	} {
		n.isEven.if {
			0:n.sum { :k |
				b[k] * b[n - k]
			}
		} {
			let m = n - 1;
			2 * (m / 2 + 1).prime
		}
	}
};
a[0:150].scatterPlot.log
~~~

![](Help/Image/isEven-I.svg)

Even numbers interleaved with repeated odd numbers,
OEIS [A186421](https://oeis.org/A186421):

~~~spl svg=J oeis=A186421
0:65.collect { :n |
	n.isEven.if {
		n
	} {
		2 * (n / 4).floor + 1
	}
}.discretePlot
~~~

![](Help/Image/isEven-J.svg)

First differences of even numbers interleaved with repeated odd numbers,
OEIS [A186422](https://oeis.org/A186422):

~~~spl svg=K oeis=A186422
0:65.collect { :n |
	n.isEven.if {
		n
	} {
		2 * (n / 4).floor + 1
	}
}.differences.discretePlot
~~~

![](Help/Image/isEven-K.svg)

* * *

See also: divisible, isInteger, isOdd

Guides: Integer Functions, Number Functions, Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EvenNumber.html)
[2](https://reference.wolfram.com/language/ref/EvenQ.html),
_OEIS_
[1](https://oeis.org/A005843)
[2](https://oeis.org/A030067),
_Smalltalk_
5.6.5.10,
_W_
[1](https://en.wikipedia.org/wiki/Even_number)

Categories: Testing, Math

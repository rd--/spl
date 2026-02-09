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

OEIS [A005843](https://oeis.org/A005843):

```
>>> 0:25.select(isEven:/1)
[
	 0  2  4  6  8  10 12 14 16 18
	20 22 24
]
```

At `LargeInteger`:

```
>>> 3L.isEven
false

>>> 1234567890L.isEven
true
```

Log plot of the semi-Fibonacci sequence,
OEIS [A030067](https://oeis.org/A030067):

~~~spl svg=A
let f = { :n |
	(n = 1).if {
		1
	} {
		n.isEven.if {
			f(n / 2)
		} {
			f(n - 1) + f(n - 2)
		}
	}
};
1:125.collect(f:/1).log.scatterPlot
~~~

![](sw/spl/Help/Image/isEven-A.svg)

Plot OEIS [A104895](https://oeis.org/A104895):

~~~spl svg=B
let a = { :n |
	(n = 0).if {
		0
	} {
		n.isEven.if {
			2 * a(n / 2)
		} {
			-2 * a((n - 1) / 2) - 1
		}
	}
};
0:150.collect(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/isEven-B.svg)

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

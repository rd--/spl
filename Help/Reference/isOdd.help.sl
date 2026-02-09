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

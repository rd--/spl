# doubleFactorial

- _doubleFactorial(n)_

The product of the positive integers of equal parity up to _n_.

```
>>> 23.doubleFactorial
316234143225

>>> [1, 3 .. 23].product
316234143225
```

Threads over lists:

```
>>> 1:10.doubleFactorial
[1 2 3 8 15 48 105 384 945 3840]
```

For even numbers, OEIS [A000165](http://oeis.org/A000165):

```
>>> (0, 2 .. 14).doubleFactorial
[1 2 8 48 384 3840 46080 645120]

>>> 14.doubleFactorial
(2, 4 .. 14).product
```

For odd numbers, OEIS [A001147](http://oeis.org/A001147):

```
>>> (1, 3 .. 13).collect(doubleFactorial:/1)
[1 3 15 105 945 10395 135135]

>>> 13.doubleFactorial
[1, 3 .. 13].product
```

Value at `zero`:

```
>>> 0.doubleFactorial
1
```

At `LargeInteger`:

```
>>> 27L.doubleFactorial
213458046676875L
```

At negative odd integers:

```
>>> [-1, -3 .. -11].doubleFactorial
[1 -1 1/3 -1/15 1/105 -1/945]
```

Relation to the factorial:

```
>>> let n = 23L;
>>> let a = n.doubleFactorial;
>>> let b = (n - 1).doubleFactorial;
>>> let c = n.factorial;
>>> a * b = c
true
```

Recurrence relation:

```
>>> let n = 23L;
>>> let a = n.doubleFactorial;
>>> let b = (n - 2).doubleFactorial;
>>> n * b = a
true
```

Extended to real numbers:

```
>>> 1.5.doubleFactorial
1.38066

>>> (3 / 13).doubleFactorial
0.995374

>>> 5.211111111.doubleFactorial
18.604664

>>> -0.5.doubleFactorial
0.920442
```

Plot over subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot { :z |
	z.doubleFactorial.clip([-10 15])
}
~~~

![](sw/spl/Help/Image/doubleFactorial-A.svg)

Plot the ratio of doubled factorials over double factorial:

~~~spl svg=B
(-0.25 -- 2).functionPlot { :n |
	n.factorial.factorial
	/
	n.doubleFactorial
}
~~~

![](sw/spl/Help/Image/doubleFactorial-B.svg)

_Note_: For integer values the generalized form can be requested especially:

```
>>> 7.doubleFactorial
105

>>> 7.doubleFactorialGeneralized
105

>>> 0.doubleFactorial
1

>>> 0.doubleFactorialGeneralized
1
```

* * *

See also: factorial, gamma, subfactorial

Guides: Combinatorial Functions, Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DoubleFactorial.html)
[2](https://reference.wolfram.com/language/ref/Factorial2.html),
_OEIS_
[1](https://oeis.org/A076668)
[2](https://oeis.org/A000165),
_W_
[1](https://en.wikipedia.org/wiki/Double_factorial)

Unicode: U+203C ‼ Double Exclamation Mark

Categories: Math

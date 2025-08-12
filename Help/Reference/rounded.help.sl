# rounded

- _rounded(x)_

Answer the integer nearest _x_,
sometimes written as _⌊x⌉_.

```
>>> 0.9.rounded
1

>>> 1.rounded
1

>>> 1.1.rounded
1

>>> -1.9.rounded
-2

>>> -2.rounded
-2

>>> -2.1.rounded
-2
```

At half integers:

```
>>> 1.5.rounded
2

>>> -1.5.rounded
-1
```

At `Complex` applies separately to real and imaginary parts:

```
>>> 5.37J-1.3.rounded
5J-1

>>> 1.4J2.6.rounded
1J3
```

Threads elementwise over lists:

```
>>> [1.e 1.pi 2.4 2.6].rounded
[3 3 2 3]

>>> [1/7 5/4 7/3 5/2].rounded
[0 1 2 3]
```

Value at Infinity:

```
>>> Infinity.rounded
Infinity
```

The definition is ambiguous for half-integers,
the implementation follows Smalltalk and truncates:

```
>>> [1.5 2.5 3.5 4.5].rounded
[2 3 4 5]

>>> [-1.5 -2.5 -3.5 -4.5].rounded
[-1 -2 -3 -4]
```

Compute Fibonacci numbers:

```
>>> 1:15.collect { :k |
>>> 	let z = (1.goldenRatio ^ k);
>>> 	(z / 5.sqrt).rounded
>>> }
[
	 1   1   2   3   5
	 8  13  21  34  55
	89 144 233 377 610
]
```

Negative numbers also round to the nearest integer:

```
>>> [-2.4 -2.5 -2.6].rounded
[-2 -2 -3]
```

Plot the function over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot(rounded:/1)
~~~

![](sw/spl/Help/Image/rounded-A.svg)

Plot _√x-⌊√x⌉_ over a subset of the reals:

~~~spl svg=A
(0 -- 16).functionPlot { :x |
	let z = x.sqrt;
	z - z.rounded
}
~~~

![](sw/spl/Help/Image/rounded-B.svg)

* * *

See also: ceiling, divisible, floor, integerPart, rescale, roundTiesEven

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Round.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#round),
_Smalltalk_
5.6.2.31

Categories: Truncating, Rounding

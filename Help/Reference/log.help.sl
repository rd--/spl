# log

- _log(z)_
- _log(z, b)_

The unary form answers the natural logarithm of _z_,
the logarithm to base _e_:

```
>>> 1000.log
6.90776

>>> 1.5.log
0.405465

>>> 1.e.log
1

>>> 2.log
0.693147
```

At `zero` and `one`:

```
>>> 0.log
-Infinity

>>> 1.log
0
```

At `Fraction`:

```
>>> 3/2.log
0.405465
```

The binary form answers the base _b_ logarithm of the number _z_.

```
>>> 1000.log(10)
3

>>> 10.log(10)
1

>>> 1.5.log(3)
0.36907

>>> 2.log(10)
3.0103E-1

>>> 1024.log(2)
10

>>> 279936.log(6)
7

>>> (3 ^ -12).log(3)
-12

>>> 1.pi.sqrt.log(1.pi)
0.5

>>> 1.log(system.nextRandomFloat)
0
```

Complex arguments:

```
>>> 2.5J1.log
0.990501J0.380506

>>> 0J1.log
0J1.5708

>>> 1.e.square.j(0).log / 1I * -2.pi.j(1)
2.j(4.pi)
```

At branch cut:

```
>>> -2J0.log
2.log.j(1.pi)
```

Show that the natural logarithm of -1 is iπ:

```
>>> -1.log
0J3.14159
```

`log` threads elementwise over lists:

```
>>> [1 2.1 3.1 4.1].log
[0 0.741937 1.13140 1.41099]

>>> [0.5 1 2 32 1024].log(2)
[-1 0 1 5 10]

>>> (2 ^ [1 2 3 4 5]).log(2)
[1 2 3 4 5]

>>> [2 4 8 16 32].reciprocal.log(2)
[-1 -2 -3 -4 -5]

>>> [2 4 8 16 32].log(1 / 2)
[-1 -2 -3 -4 -5]
```

Calculate the lower Fibonacci inverse,
OEIS [A130233](https://oeis.org/A130233):

```
>>> 0:20.collect { :n |
>>> 	let a = (5.sqrt * n + 1.5).log;
>>> 	let b = ((1 + 5.sqrt) / 2).log;
>>> 	(a / b).truncate
>>> }
[0 2 3 4 4 5 5 5 6 6 6 6 6 7 7 7 7 7 7 7 7]
```

Note that `log` is subject to the usual small inaccuracies,
in particular it should not be used to implement `integerLength`:

```
>>> 1000.log(10).floor + 1 = 3
true

>>> 1000.integerLength(10) = 4
true
```

Plot over a subset of the reals:

~~~spl svg=A
(0.01 -- 5).functionPlot(log:/1)
~~~

![](sw/spl/Help/Image/log-A.svg)

Polar plot:

~~~spl svg=B
(0.01 -- 6.pi).polarPlot(log:/1)
~~~

![](sw/spl/Help/Image/log-B.svg)

Plot `log` at integer points:

~~~spl svg=C
{ :x :y |
	let z = x * y;
	(z = 0).if {
		0
	} {
		z.log.abs.fractionalPart
	}
}.table(-6:6, -6:6)
.matrixPlot
~~~

![](sw/spl/Help/Image/log-C.svg)

Complex plot:

~~~spl png=D
[-2J-2 2J2].complexPlot { :z |
	(z ^ 3).log
}
~~~

![](sw/spl/Help/Image/log-D.png)

Calculate the time for a given principal to double under compound interest at rate _r_,
given conversion period _n_:

~~~spl svg=E
let m = 2;
let n = 1;
(1 -- 20).percent.functionPlot { :r |
	m.log / (n * (1 + (r / n)).log)
}
~~~

![](sw/spl/Help/Image/log-E.svg)

* * *

See also: exp, log2, log10, logarithmicIntegral

Guides: Mathematical Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Logarithm),
_Dlmf_
[1](https://dlmf.nist.gov/4.2#i),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/hatdot),
_Mathematica_
[1](https://mathworld.wolfram.com/Logarithm.html)
[2](https://mathworld.wolfram.com/NaturalLogarithm.html)
[3](https://mathworld.wolfram.com/CommonLogarithm.html)
[4](https://mathworld.wolfram.com/BinaryLogarithm.html)
[5](https://mathworld.wolfram.com/Ln.html)
[6](https://reference.wolfram.com/language/ref/Log.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.log.html),
_OEIS_
[1](https://oeis.org/A130233),
_Smalltalk_
5.6.7.9
5.6.7.10,
_W_
[1](https://en.wikipedia.org/wiki/Logarithm)
[2](https://en.wikipedia.org/wiki/Natural_logarithm)

Unicode: U+235F ⍟ Apl Functional Symbol Circle Star

Categories: Math

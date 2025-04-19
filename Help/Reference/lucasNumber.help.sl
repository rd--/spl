# lucasNumber

- _lucasNumber(anInteger)_

Answer the _anInteger_-th Lucas number.
The Lucas numbers _L(n)_ satisfy the recurrence relation _L(n) = L(n-1) + L(n-2)_ with _L(1) = 1_ and _L(2) = 3_.

Compute the first twenty Lucas numbers:

```
>>> 1:20.collect(lucasNumber:/1)
[
	1 3 4 7 11
	18 29 47 76 123
	199 322 521 843 1364
	2207 3571 5778 9349 15127
]
```

At `SmallFloat`:

```
>>> (11 / 3).lucasNumber
5.92396
```

At negative integer:

```
>>> -11.lucasNumber
-199
```

Threads elementwise over lists:

```
>>> [1 2 3 4 5].lucasNumber
[1 3 4 7 11]
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot(lucasNumber:/1)
~~~

![](sw/spl/Help/Image/lucasNumber-A.svg)

* * *

See also: fibonacci, lucasNumbers

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LucasNumber.html)
[2](https://reference.wolfram.com/language/ref/LucasL.html),
_OEIS_
[1](https://oeis.org/A000032),
_W_
[1](https://en.wikipedia.org/wiki/Lucas_number)

Categories: Math, Function, Sequence

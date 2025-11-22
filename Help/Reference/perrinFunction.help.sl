# perrinFunction

- _perrinFunction(x)_

The Perrin numbers are a doubly infinite constant-recursive integer sequence with characteristic equation _x^3=x+1_.
The Perrin numbers bear the same relationship to the Padovan sequence as the Lucas numbers do to the Fibonacci sequence.

The first few terms in positive direction:

```
>>> 0:17.collect(perrinFunction:/1)
[
	3 0 2 3 2 5 5 7 10 12
	17 22 29 39 51 68 90 119
]
```

The first few terms in negative direction:

```
>>> 0:-17:-1.collect(perrinFunction:/1)
[
	3 -1 1 2 -3 4 -2 -1 5 -7 6
	-1 -6 12 -13 7 5 -18
]
```

The first thirteen prime Perrin numbers:

```
>>> [
>>> 	2 3 4 5 6 7 10 12 20 21
>>> 	24 34 38
>>> ].collect(perrinFunction:/1)
[
	2 3 2 5 5 7 17 29 277 367
	853 14197 43721
]
```

Plot over a subset of the reals:

~~~spl svg=A
(-10 -- 10).functionPlot(
	perrinFunction:/1
)
~~~

![](sw/spl/Help/Image/perrinFunction-A.svg)

* * *

See also: fibonacci, lucasNumber, perrinSequence

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PerrinSequence.html),
_OEIS_
[1](https://oeis.org/A001608)
[2](https://oeis.org/A112881),
_W_
[1](https://en.wikipedia.org/wiki/Perrin_number)

Categories: Math, Function, Sequence

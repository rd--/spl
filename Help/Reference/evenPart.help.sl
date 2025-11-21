# evenPart

- _evenPart(n)_

Answer the even part of the integer _n_,
the highest power of two dividing _n_.

The first few terms,
OEIS [A006519](https://oeis.org/A006519):

```
>>> 1:20.collect(evenPart:/1)
[
	1 2 1 4 1  2 1 8 1 2
	1 4 1 2 1 16 1 2 1 4
]
```

Plot:

~~~spl svg=A
1:127.collect(evenPart:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/evenPart-A.svg)

* * *

See also: integerExponent, oddPart

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EvenPart.html),
_OEIS_
[1](https://oeis.org/A006519)

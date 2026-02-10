# bitLength

- _bitLength(n)_

Answer the number of binary bits necessary to represent the integer _n_.

```
>>> 32.bitLength
6

>>> -64.bitLength
7
```

Equivalent to `floor` of `log` plus `one`:

```
>>> 32.log(2).floor + 1
6
```

Threads over lists,
first few terms,
OEIS [A029837](https://oeis.org/A029837):

```
>>> 0:23.bitLength
[
	0 1 2 2 3 3 3 3 4 4
	4 4 4 4 4 4 5 5 5 5
	5 5 5 5
]
```

Plot is a kind of staircase:

~~~spl svg=A
(-25:25).functionPlot(bitLength:/1)
~~~

![](sw/spl/Help/Image/bitLength-A.svg)

Plot
[A003817](https://oeis.org/A003817):

~~~spl svg=B
(2 ^ 0:50.bitLength).discretePlot
~~~

![](sw/spl/Help/Image/bitLength-B.svg)

* * *

See also: integerLength

Guides: Bitwise Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BitLength.html),
_OEIS_
[1](https://oeis.org/A029837)

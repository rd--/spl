# ratioToSavarts

- _ratioToSavarts(n/d)_

Answer the interval given by the ratio _n/d_ in Savarts.
The inverse is `savartsToRatio`.

The minor half-tone:

```
>>> 25/24.ratioToSavarts
17.729

>>> 18.savartsToRatio
>>> .rationalize(1E-3)
25/24
```

The limma:

```
>>> 256/243.ratioToSavarts
22.634
```

The major limma:

```
>>> 135/128.ratioToSavarts
23.124
```

The major half-tone:

```
>>> 16/15.ratioToSavarts
28.029

>>> 28.savartsToRatio
>>> .rationalize(1E-3)
16/15
```

The Greek limma:

```
>>> 256/243.ratioToSavarts
22.634
```

The comma:

```
>>> 81/80.ratioToSavarts
5.395

>>> 5.savartsToRatio
>>> .rationalize(1E-3)
81/80
```

The unison, perfect fifth and octave:

```
>>> 1/1.ratioToSavarts
0

>>> 3/2.ratioToSavarts
176.09

>>> 2/1.ratioToSavarts
301.03

>>> 2.log10 * 1000
301.03
```

The Pythagorean comma:

```
>>> (3/2 ^ 12).octaveReduce
>>> .ratioToSavarts
5.885
```

Threads over lists:

```
>>> [53 359].collect { :n |
>>> 	(3/2 ^ n).octaveReduce
>>> }.ratioToSavarts
[0.9069 0.4629]
```

At fractions with large components,
from a table of lyŭ according to the system of Jing Fang (Daniélou 1943):

```
>>> ((3L ^ 36) / (2L ^ 57))
>>> .ratioToSavarts
17.655

>>> ((3L ^ 48) / (2L ^ 76))
>>> .ratioToSavarts
23.541

>>> ((3L ^ 31) / (2L ^ 49))
>>> .ratioToSavarts
40.289

>>> ((3L ^ 14) / (2L ^ 22))
>>> .ratioToSavarts
57.038
```

Plot over four octaves:

~~~spl svg=A
(1 -- (2 ^ 4)).functionPlot(
	ratioToSavarts:/1
)
~~~

![](Help/Image/ratioToSavarts-A.svg)

* * *

See also: centsToRatio, savartsToCents, savartsToRatio

Guides: Tuning Functions, Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Savart)
[2](https://en.wikipedia.org/wiki/One-third_octave)

Unicode: U+03C3 σ Greek Small Letter Sigma

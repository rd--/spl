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

* * *

See also: centsToRatio, savartsToCents, savartsToRatio

References:
_W_
[1](https://en.wikipedia.org/wiki/Savart)
[2](https://en.wikipedia.org/wiki/One-third_octave)

Unicode: U+03C3 σ Greek Small Letter Sigma

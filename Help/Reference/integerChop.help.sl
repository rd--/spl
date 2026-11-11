# integerChop

- _integerChop(x, ε=1E-10)_

Replaces approximate real numbers that are close to an integer by the exact integer.

Round a real number close to seven:

```
>>> 7.00000000001.integerChop
7.0

>>> 6.99999999999.integerChop
7.0
```

Retain differences greater than epsilon:

```
>>> 7.0000000001.integerChop
7.0000000001

>>> 6.9999999999.integerChop
6.9999999999
```

Specify epsilon:

```
>>> 7.0001.integerChop(1E-4)
7.0

>>> 6.9999.integerChop(1E-4)
7.0
```

Drop small imaginary parts:

```
>>> let a = [1 .. 20];
>>> let b = a.fourier.inverseFourier;
>>> let c = b.integerChop;
>>> let d = b.chop;
>>> (
>>> 	b.allSatisfy(isComplex/1),
>>> 	c = a,
>>> 	d.noneSatisfy(isComplex/1),
>>> 	d.noneSatisfy(isInteger/1),
>>> 	c
>>> )
(true, true, true, true, [1 .. 20])
```

* * *

See also: chop, isNearInteger, round

Guides: Rounding Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AlmostInteger.html)
[2](https://resources.wolframcloud.com/FunctionRepository/resources/IntegerChop)

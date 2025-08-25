# chop

- _chop(x, ε=1E-10)_

Replaces approximate real numbers that are close to zero by the exact `zero`.

Zero out elements that are very close to zero:

```
>>> [1 .. 20].fourier.inverseFourier.chop
[1 .. 20]
```

Drop small imaginary parts:

```
>>> [1 .. 4].pi.i.exp.chop
[-1 1 -1 1]
```

Test if two numbers are the same to a certain tolerance:

```
>>> let x = 1.pi;
>>> let r = x.rationalize(1E-12);
>>> let a = (x - r).chop;
>>> let b = (x - r).chop(1E-14);
>>> (a.isZero, b.isZero)
(true, false)
```

* * *

See also: clip, floor, integerPart, rationalize, round, threshold

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Chop.html)

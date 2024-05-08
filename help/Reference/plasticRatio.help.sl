# plasticRatio

- _plasticRatio(aNumber)_

The plastic ratio (rho) ,
also called the minimal Pisot number or plastic number or plastic constant,
is the limiting ratio of the successive terms of the Padovan sequence or Perrin sequence.

```
>>> 1.plasticRatio
1.32472

>>> 1.plasticRatio.continuedFraction(10)
[1 3 12 1 1 3 2 3 2 4]
```

Powers of rho generate almost integers:

```
>>> 1.plasticRatio ^ 29
3480
```

The Plastic Number represents the smallest proportional growth of three-dimensional objects:

```
>>> let p = 1.plasticRatio;
>>> (1 + p) = (p ^ 3)
true
```

Sums of negative exponents answer integers:

```
>>> 0:13.collect { :n |
>>> 	1.plasticRatio ^ n.-
>>> }.sum
4
```

C.f. `goldenRatio`:

```
>>> (1.goldenRatio ^ [0 -1 -2]).sum
2
```

The harmonic mean of _4/3, (3+4)/5 & 5/4_:

```
>>> [4/3 7/5 5/4].harmonicMean
(1.plasticRatio + 1/4922)
```

The plastic ratio is close to the seventh root of seven:

```
>>> 7 ^ (1 / 7)
(1.plasticRatio - 0.0042)
```

* * *

See also: goldenRatio, metallicMean

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PlasticConstant.html),
_OEIS_
[1](https://oeis.org/A060006),
_W_
[1](https://en.wikipedia.org/wiki/Plastic_ratio)


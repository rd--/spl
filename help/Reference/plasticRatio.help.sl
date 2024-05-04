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

* * *

See also: goldenRatio, metallicMean

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PlasticConstant.html),
_OEIS_
[1](https://oeis.org/A060006),
_W_
[1](https://en.wikipedia.org/wiki/Plastic_ratio)


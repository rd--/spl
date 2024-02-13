# rescale

- _rescale(aNumber | aCollection, min, max, yMin, yMax)_
- _rescale(alpha, beta, gamma)_ => _rescale(alpha, beta, gamma, 0, 1)_
- _rescale(alpha)_ => _rescale(alpha, alpha.min, alpha.max, 0, 1)_

Answer _aNumber_ rescaled to run from _yMin_ to _yMax_ over the range _min_ to _max_.

```
>>> 2.5.rescale(-10, 10)
0.625

>>> 12.5.rescale(-10, 10)
1.125

>>> [-10, 0, 10].rescale(-10, 10)
[0 0.5 1]
```

At Fraction:

```
>>> -3/2.rescale(-2, 2)
1/8
```

At SmallFloat:

```
>>> pi.rescale(0, 2.5, 0, 1)
1.25664

>>> 3.rescale(-9, 7, 11, 28)
(95 / 4)

>>> (1 / 11).rescale(1 / 7, 5)
-0.010695

>>> 8.rescale(-9, 7.11111)
1.05517
```

Rescale so that all the List elements run from 0 to 1:

```
>>> [-0.7 0.5 1.2 5.6 1.8].rescale
[0 0.19048 0.30159 1 0.39683]

>>> [-2 0 2].rescale
[0 0.5 1]
```

Specify the maximum and minimum values:

```
>>> [-2 0 2].rescale(-5, 5)
[0.3 0.5 0.7]

>>> [-2 0 2].rescale(-5, 5, -1, 1)
[-2 / 5, 0, 2 / 5]
```

Make a Celsius-to-Fahrenheit conversion table:

```
>>> (-40, -30 .. 80).collect { :each | [each, each.rescale(-40, 100, -40, 212)] }
[-40 -40; -30 -22; -20 -4; -10 14; 0 32;  10 50; 20 68;  30 86; 40 104; 50 122; 60 140; 70 158; 80 176]
```

Plot over a subset of the reals:

```
(-3, -2.99 .. 3).collect { :each | each.rescale(-2, 2) }.plot
```

* * *

See also: clip, mean, scaled

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Rescale.html)

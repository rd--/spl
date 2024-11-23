# arithmeticMean

- _arithmeticMean(aCollection)_

Answer the `sum` of the collection divided by the `size`.

```
>>> [1 .. 9].arithmeticMean
5

>>> let c = [1 .. 9];
>>> c.sum / c.size
5

>>> [1.21 3.4 2.15 4 1.55].arithmeticMean
2.462
```

The arithmetic mean of 1/1 and 3/2 is 5/4:

```
>>> [1 3/2].arithmeticMean
5/4
```

The arithmetic mean of 5/4 and 6/5 is 49/40:

```
>>> [5/4 6/5].arithmeticMean
49/40
```

The arithmetic mean of 9/8 and 10/9 is 161/144:

```
>>> [9/8 10/9].arithmeticMean
161/144
```

* * *

See also: geometricMean, median, size, sum

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Mean.html)
[2](https://reference.wolfram.com/language/ref/Mean.html),
_Xenharmonic_
[1](https://en.xen.wiki/w/Arithmetic_mean)

Categories: Statistics

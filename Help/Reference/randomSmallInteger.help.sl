# randomSmallInteger

- _randomSmallInteger(r, [min max], shape)_

Answer an array of the indicated _shape_ containing random small integers between _min_ and _max_.

Generate a random small integer between one and nine, inclusive:

```
>>> Sfc32(79143)
>>> .randomSmallInteger([1 9], [])
5
```

Generate a random small integer between 3 and 11, inclusive:

```
>>> Sfc32(79143)
>>> .randomSmallInteger([3 11], [])
7
```

Generate a `List` of thirteen random small integers:

```
>>> Sfc32(76941)
>>> .randomSmallInteger([1 9], [13])
[4 1 3 5 4 2 6 4 9 1 3 8 4]
```

A 3×4 matrix of random small integers:

```
>>> Sfc32(49825)
>>> .randomSmallInteger([1 9], [3 4])
[
	5 8 5 7;
	8 3 7 4;
	2 6 8 1
]
```

A 2×2×2 array of random small integers:

```
>>> let r = Sfc32(12345);
>>> r.randomSmallInteger([1 9], [2 2 2])
[8 5; 9 9:; 4 7; 5 8]
```

Constrained random points on a circle:

~~~spl svg=A
Sfc32(79143)
.randomSmallInteger([-15 15], [100 2])
.select { :p |
	let h = p.square.sum.sqrt;
	h >= 10 & { h <= 15 }
}.PointCloud
~~~

![](Help/Image/randomSmallInteger-A.svg)

* * *

See also: RandomNumberGenerator, atRandom, randomByteArray, randomInteger, randomReal, randomSample

Guides: Random Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomInteger.html)

Categories: Random

# randomIntegerExcluding

- _randomIntegerExcluding(r, min, max, f:/1, shape)_

Answer an array of the indicated _shape_ containing random integer between _min_ and _max_,
that do not match the predicate function _f_.

Random odd integers:

```
>>> let r = Sfc32(37194);
>>> r.randomIntegerExcluding(
>>> 	1, 23, isEven:/1, [5 5]
>>> )
[
	15  7  1 17  1;
	17  5 15 17 13;
	 5 11 19  7  1;
	 3  1 15 23 15;
	21 11 23 17 23
]
```

Random non-zero integers:

```
>>> let r = Sfc32(37194);
>>> r.randomIntegerExcluding(
>>> 	-23, 23, isZero:/1, [5 5]
>>> )
[
	  6  20 -11 -22   9;
	-22  10  -4   8 -14;
	 -7  -1 -12   6 -16;
	 10 -16   2 -14  -2;
	 21  14  -9 -12 -23
]
```

* * *

See also: randomInteger, randomReal

Categories: Random

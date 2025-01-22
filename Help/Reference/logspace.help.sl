# logspace

- _logspace(a, b, n)_

Answer an _n_ point logarithmically spaced list from _10^a_ to _10^b_.

At `SmallFloat`, create a `List` of seven logarithmically spaced points in the interval _10^1 -- 10^5_:

```
>>> 1.logspace(5, 7)
[
	1E1 46.42 215.44
	1000 4641.6 21544
	1E5
]
```

At `Complex`, create a `List` of eight evenly spaced points in the interval _10^1J2 -- 10^5J5_:

```
>>> 1J2.logspace(5J5, 8)
[
	-1.0701J-9.942 28.72J-23.76
	132.92J40.48 147.3J496.6
	-1241.5J1478.6 -7149.7J-822.3
	-12136J-23924 49457J-86913
]
```

* * *

See also: discretize, linspace, subdivide

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/logspace.html)

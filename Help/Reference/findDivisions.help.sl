# findDivisions

- _findDivisions(anInterval, anInteger)_

Answer a list of about _anInteger_ "nice" numbers that divide the interval around _anInterval_ into equally spaced parts.

Find five divisions of the interval _(0,1)_:

```
>>> (0 -- 1).findDivisions(5).asList
[0 1/5 2/5 3/5 4/5 1]
```

Find five divisions of the interval _(7,95)_:

```
>>> (7 -- 95).findDivisions(5).asList
[0 20 40 60 80 100]
```

```
>>> (7 -- 93).findDivisions(10).asList
[0 10 20 30 40 50 60 70 80 90 100]
```

Division endpoints may be outside the initial range:

```
>>> (0.1 -- 0.9).findDivisions(5).asList
[0 1/5 2/5 3/5 4/5 1]
```

Find divisions that are aligned to multiples of `pi`:

```
>>> (0 -- 10).findDivisions(pi, 5)
[0 3.14159 6.28318 9.42478 12.56637]
```

* * *

See also: histogramList, subdivide

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FindDivisions.html)

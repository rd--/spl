# blomqvistBeta

- _blomqvistBeta(v, w)_

Answer Blomqvist’s medial correlation coefficient β for the vectors _v_ and _w_.

```
>>> let p = [
>>> 	-20 -24 0 4 24
>>> 	36 -12 -12 56 -14
>>> ];
>>> let q = [
>>> 	3 -4 1 4 22
>>> 	17 -2 2 13 -11
>>> ];
>>> let r = [
>>> 	-20 -21 1 7 24
>>> 	36 -10 -12 56 -14
>>> ];
>>> (
>>> 	p.median,
>>> 	q.median,
>>> 	r.median,
>>> 	p.blomqvistBeta(q),
>>> 	q.blomqvistBeta(r)
>>> )
(-6, 5/2, -9/2, 3/5, 3/5)
```

Blomqvist’s β ranges from _-1_ to _1_ for high negative and high positive association, respectively.
The absolute magnitude of β tends to 1 given strong linear dependence.

```
>>> [1.5, 3, 5, 10].blomqvistBeta(
>>> 	[2, 1.25, 15, 8]
>>> )
1
```

* * *

See also: correlation

Guides: Statistics Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BlomqvistBeta.html)

Categories: Statistics

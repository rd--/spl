# moment

- _moment(aCollection, r)_

Answer the order _r_ moment of _aCollection_.

Second moment of four-vector:

```
>>> 1:4.moment(2)
(15 / 2)
```

First moment of three-vector:

```
>>> [1.pi 1.e 2].moment(1)
(1 / 3 * (2 + 1.e + 1.pi))
```

* * *

See also: centralMoment, mean

Guides: Statistics Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Moment.html),
_W_
[1](https://en.wikipedia.org/wiki/Moment_(mathematics))

Categories: Statistics

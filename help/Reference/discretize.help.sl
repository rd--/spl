# discretize

- _discretize(anInterval, anInteger, aBlock:/1)_
- _discretize(alpha,  beta)_ => _discretize(alpha,  beta, identity:/1)_

Answer a `List` of _anInteger_ places having a linear interpolation of _anInterval_.

```
>>> Interval(-0.5, 0.5).discretize(3)
[-0.5, 0, 0.5]

>>> Interval(-0.5, 0.5).discretize(5)
[-0.5 -0.25 0 0.25 0.5]

>>> Interval(-0.5, 0.5).discretize(9)
[-0.5 -0.375 -0.25 -0.125 0 0.125 0.25 0.375 0.5]
```

In the ternary form apply _aBlock_ to each element during construction.

```
>>> Interval(0, 1).discretize(3, exp:/1)
[1 1.648721 2.718282]
```

Plot `exp` function at one hundred places from zero to five:

~~~
Interval(0, 5).discretize(100, exp:/1).plot
~~~

Plot `hannFunction`:

~~~
Interval(-0.5, 0.5).discretize(100, hannFunction:/1).plot
~~~

* * *

See also: Interval

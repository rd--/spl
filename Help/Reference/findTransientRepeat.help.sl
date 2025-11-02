# findTransientRepeat

- _findTransientRepeat([x₁ x₂ …], n)_

Answer the minimal substring of _x_ that repeats to give the sequence _x_.

Find the transient and repeated parts of a list:

```
>>> [1 2 1 2 1 2]
>>> .findTransientRepeat(3)
[; 1 2]

>>> [1 2 3 4 3 4 3 4]
>>> .findTransientRepeat(3)
[1 2; 3 4]
```

Too few repeats:

```
>>> [1 2 3 4 3 4 3 4]
>>> .findTransientRepeat(4)
[1 2 3 4 3 4 3 4; ]
```

The last sublist does not need to be complete:

```
>>> [
>>> 	1 2 3 4
>>> 	1 2 3 4
>>> 	1 2 3
>>> ].findTransientRepeat(2)
[; 1 2 3 4]
```

Quadratic irrational numbers have continued fractions that are ultimately periodic:

```
>>> let x = (12.sqrt + 2) / 7;
>>> let c = x.continuedFraction(20);
>>> c.findTransientRepeat(2)
[0 1; 3 1 1 3 1 5]
```

At `String`:

```
>>> 'abcdedede'.findTransientRepeat(2)
['abc' 'de']
```

Compare the representations for a rational number with an infinite decimal part:

```
>>> let r = 11 / 7;
>>> let [d, _] = r.realDigits(10, 15);
>>> d.findTransientRepeat(2)
[1; 5 7 1 4 2 8]

>>> (11 / 7).asString
>>> .findTransientRepeat(2)
['1.' '571428']
```

If no subsequence is found answers _x_ and an empty list:

```
>>> let x = [1 2 3 4 5];
>>> x.findTransientRepeat(2)
[x, []]
```

Find the period of a continuous function,
using `~` to compare items:

~~~spl svg=A
[0, 1/6.pi .. 8.pi].cos
.findTransientRepeat(2, ~)
.second
.discretePlot
~~~

![](sw/spl/Help/Image/findTransientRepeat-A.svg)

* * *

See also: findRepeat, repeat, table

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FindTransientRepeat.html)

# findRepeat

- _findRepeat([x₁ x₂ …], f:/2)_

Answer the minimal substring of _x_ that repeats to give the sequence _x_.

Find the sublist that repeats to form a list:

```
>>> [
>>> 	1 2 3 4
>>> 	1 2 3 4
>>> 	1 2 3 4
>>> ].findRepeat
[1 2 3 4]
```

At a constant list:

```
>>> [1 1 1 1 1].findRepeat
[1]
```

The last sublist does not need to be complete:

```
>>> [
>>> 	1 2 3 4
>>> 	1 2 3 4
>>> 	1 2 3
>>> ].findRepeat
[1 2 3 4]
```

There need not even be a second complete repetition:

```
>>> [
>>> 	1 2 3 4
>>> 	1 2 3
>>> ].findRepeat
[1 2 3 4]
```

At `String`:

```
>>> 'ababab'.findRepeat
'ab'
```

Use equivalence classes based on absolute value:

```
>>> [1 2 -3 -1 2 3 -1 -2]
>>> .findRepeat { :a :b |
>>> 	a.abs = b.abs
>>> }
[1 2 -3]
```

Use equivalence classes based on floor:

```
>>> [1 2 3 1.5 2.8 3.7 1.1 2.6]
>>> .findRepeat { :a :b |
>>> 	a.floor = b.floor
>>> }
[1 2 3]
```

Use `sum` of list elements:

```
>>> [1 2; 5 -2; 2 1; 0 3; -1 4]
>>> .findRepeat { :a :b |
>>> 	a.sum = b.sum
>>> }
[[1 2]]
```

If no subsequence is found answers _x_:

```
>>> let x = [1 2 3 4 5];
>>> x == x.findRepeat
true
```

Find the period of a continuous function,
using `~` to compare items:

~~~spl svg=A
[0, 1/6.pi .. 8.pi].cos
.findRepeat(~)
.discretePlot
~~~

![](sw/spl/Help/Image/findRepeat-A.svg)

* * *

See also: findTransientRepeat, repeat, table

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FindRepeat.html)

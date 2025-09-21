# recurrenceFilter

- _recurrenceFilter([α β], x, y=[0])_

Filters _x_ using a linear recurrence equation with coefficients _α_ and _β_,
and initial condition _y_.

Filtering of a unit impulse sequence:

```
>>> [1 -0.5; 1].recurrenceFilter(
>>> 	[1 0 0 0 0 0]
>>> )
1 / [1 2 4 8 16 32]
```

Specify an initial condition:

```
>>> [1 -0.5; 1].recurrenceFilter(
>>> 	[1 0 0 0 0 0],
>>> 	[1]
>>> )
3 / [2 4 8 16 32 64]
```

Step response of a non-recursive filter:

```
>>> [1; 1/3 1/3 1/3].recurrenceFilter(
>>> 	[1 1 1 1 1 1]
>>> )
[1/3 2/3 1 1 1 1]
```

`convolve` and `recurrenceFilter` give equivalent answers for non-recursive digital filters:

```
>>> let k = [1/3 1/3 1/3];
>>> let x = [0 0 1 1 1 1 0 0];
>>> (
>>> 	k.convolve(x),
>>> 	[[1], k].recurrenceFilter(x)
>>> )
(
	[0 0 1/3 2/3 1 1 2/3 1/3 0 0],
	[0 0 1/3 2/3 1 1 2/3 1/3]
)
```

Define a moving-average filter with a window size of three:

```
>>> let a = [1];
>>> let b = 1/3 # 3;
>>> let x = [2 1 6 2 4 3];
>>> [a, b].recurrenceFilter(x)
[2/3 1 3 3 4 3]
```

Discard initial outputs:

```
>>> let a = [1];
>>> let b = 1/3 # 3;
>>> let x = [1 3 2 1 6 2 4 3];
>>> let y = [a, b].recurrenceFilter(x);
>>> y.allButFirst(2)
[2 2 3 3 4 3]
```

* * *

See also: convolve, meanFilter

Guides: Filter Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RecurrenceFilter.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/filter.html)

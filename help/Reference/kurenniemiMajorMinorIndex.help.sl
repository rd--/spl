# kurenniemiMajorMinorIndex

- _kurenniemiMajorMinorIndex(aCollection)_

A measure of the major-ness or minor-ness of a rational chord or scale.
Answers a number in the range (-1 … +1), where -1 indicates major, +1 minor and 0 neutral.

Find indices for the
major triad root position _(4 5 6)_,
major triad first inversion _(5 6 8)_,
major triad second inversion _(6 8 10)_,
minor triad _(10 12 15)_,
major triad _(2 3 5)_,
first six partials _(1 2 3 4 5 6)_,
major seventh _(1 5/4 3/2 15/8 or 8 10 12 15)_,
minor seventh _(1 6/5 3/2 15/8 or 40 48 60 75)_,
dominant seventh _(1 5/4 3/2 16/9 or 36 45 54 64)_:

```
>>> [
>>> 	4 5 6;
>>> 	5 6 8;
>>> 	6 8 10;
>>> 	10 12 15;
>>> 	2 3 5;
>>> 	1 2 3 4 5 6;
>>> 	1 5/4 3/2 15/8; 8 10 12 15;
>>> 	1 6/5 3/2 15/8; 40 48 60 75;
>>> 	1 5/4 3/2 16/9; 36 45 54 64
>>> ].collect(kurenniemiMajorMinorIndex:/1)
[
	-0.22047
	-0.23681
	-0.33333
	0.22047
	-0.33333
	-0.46436
	0 0
	0.12636 0.12636
	-0.14289 -0.14289
]
```

* * *

See also: gcd, lcm, log

Further Reading: Kurenniemi 2015

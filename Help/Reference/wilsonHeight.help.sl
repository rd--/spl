# wilsonHeight

- _wilsonHeight(aFraction)_

The Wilson is given by the sum of prime factors with repetition.

```
>>> 81/64.wilsonHeight
24

>>> (81 * 64).primeFactors.sum
24
```

Threads over lists:

```
>>> [81/1 80/1 81/80 6480/1].wilsonHeight
[12 13 25 25]

>>> [80/79 82/81].wilsonHeight
[92 55]
```

Plot as consonance measure for a set of 38 just intervals:

~~~spl svg=A
let x = [
	33/32 16/15 11/10 9/8 7/6
	6/5 11/9 5/4 9/7 4/3
	11/8 7/5 16/11 3/2 14/9
	8/5 18/11 5/3 7/4 9/5
	11/6 15/8 27/14 2/1 33/16
	32/15 9/4 12/5 5/2 8/3
	14/5 3/1 16/5 10/3 7/2
	18/5 15/4 4/1
];
let y = 1 - x.wilsonHeight.rescale;
(x -> y).discretePlot
~~~

![](sw/spl/Help/Image/wilsonHeight-A.svg)

* * *

See also: benedettiHeight, tenneyHeight

Guides: Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Wilson_height)

Categories: Tuning

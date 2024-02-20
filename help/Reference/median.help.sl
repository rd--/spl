# median

- _median(aSequence)_

When the sequence is sorted the median is given by center element if is length is odd,
and the mean of the two center elements if it is even.

```
>>> 1:7.median = 4 & { 1:7[4] = 4 }
true

>>> 1:8.median = 4.5 & { (1:8[4] + 1:8[5]) / 2 = 4.5 }
true

>>> [1 7 6 2 3 5 4].median
4
```

* * *

See also: mean

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Median.html)
[2](https://reference.wolfram.com/language/ref/Median.html)

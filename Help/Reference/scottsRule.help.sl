# scottsRule

- _scottsRule(aList)_

Answer the Scott rule to select the bin-width for a histogram.

```
>>> let r = Sfc32(687423);
>>> [99 1111 3333].collect { :n |
>>> 	r.randomReal(0, 1, [n])
>>> 	.scottsRule
>>> }
[0.21782 0.09998 0.06733]

>>> 1:99.scottsRule
21.674

>>> List(99, 1).scottsRule
0
```

* * *

See also: freedmanDiaconisRule, histogramList, sturgesRule

References:
_W_
[1](https://en.wikipedia.org/wiki/Scott%27s_rule)

Categories: Statistics

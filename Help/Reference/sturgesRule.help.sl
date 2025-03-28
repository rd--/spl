# sturgesRule

- _sturgesRule(aList)_

Answer Sturgess rule to select the number of bins for a histogram.

```
>>> let r = Sfc32(687423);
>>> [99 1111 3333].collect { :n |
>>> 	List(n, nil)
>>> 	.sturgesRule
>>> }
[7 11 12]

>>> [99 1111 3333].collect { :n |
>>> 	n.log(2).floor + 1
>>> }
[7 11 12]
```

* * *

See also: freedmanDiaconisRule, histogramList, scottsRule

References:
_W_
[1](https://en.wikipedia.org/wiki/Sturges%27s_rule)

Categories: Statistics

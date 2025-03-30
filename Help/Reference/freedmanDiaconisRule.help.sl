# freedmanDiaconisRule

- _freedmanDiaconisRule(aList)_

Answer the Freedman-Diaconis rule to select the bin-width for a histogram.

```
>>> let r = Sfc32(687423);
>>> [99 1111 3333].collect { :n |
>>> 	r.randomReal([0 1], [n])
>>> 	.freedmanDiaconisRule
>>> }
[0.20378 0.10199 0.06616]

>>> 1:99.freedmanDiaconisRule
21.4

>>> List(99, 1).freedmanDiaconisRule
0
```

* * *

See also: histogramList, scottsRule, sturgesRule

References:
_W_
[1](https://en.wikipedia.org/wiki/Freedman%E2%80%93Diaconis_rule)

Categories: Statistics

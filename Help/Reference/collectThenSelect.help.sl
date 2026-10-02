# collectThenSelect

- _collectThenSelect(c, f/1, g/1)_

Equivalent to _c.collect(f).select(g)_ but does not generate any intermediate structure.

```
>>> [1 .. 9].collectThenSelect(
>>> 	square/1,
>>> 	isOdd/1
>>> )
[1 9 25 49 81]

>>> [1 .. 9].collect(
>>> 	square/1
>>> ).select(
>>> 	isOdd/1
>>> )
[1 9 25 49 81]

>>> [1 .. 9].select { :x |
>>> 	x.square.isOdd
>>> }
[1 3 5 7 9]
```

* * *

See also: collect, select

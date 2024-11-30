# niceNumberNear

- _niceNumberNear(aNumber)_

Answer a "nice" number near to _aNumber_.

Find three nice numbers:

```
>>> [0.0415 0.0681 0.0896].collect(niceNumberNear:/1)
[0.05 0.075 0.1]
```

An `Association` `List` of numbers to nice numbers:

```
>>> let l = [0.083 0.149 0.192 0.231 0.352 0.567 0.791];
>>> l.collect { :each | each -> each.niceNumberNear }
[
	0.083 -> 0.075,
	0.149 -> 0.150,
	0.192 -> 0.200,
	0.231 -> 0.250,
	0.352 -> 0.250,
	0.567 -> 0.500,
	0.791 -> 0.750
]
```

Nice numbers starting from integers:

```
>>> [7 11 23 31 47 64 78].collect(niceNumberNear:/1)
[7.5 10 25 25 50 75 75]
```

* * *

See also: niceNumberAbove

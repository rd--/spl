# niceNumberAbove

- _niceNumberAbove(aNumber)_

Answer a "nice" number greater than or equal to _aNumber_.

Find three nice numbers:

```
>>> [0.0415 0.0681 0.0896].collect(
>>> 	niceNumberAbove:/1
>>> )
[0.05 0.075 0.1]
```

An `Association` `List` of numbers to nice numbers:

```
>>> let l = [0.083 0.149 0.192 0.231 0.352 0.567 0.791];
>>> l.collect { :each | each -> each.niceNumberAbove }
[
	0.083 -> 0.10,
	0.149 -> 0.15,
	0.192 -> 0.20,
	0.231 -> 0.25,
	0.352 -> 0.50,
	0.567 -> 0.75,
	0.791 -> 1.00
]
```

Nice numbers starting from integers:

```
>>> [7 11 23 31 64 78].collect(niceNumberAbove:/1)
[7.5 15 25 50 75 100]
```

One is already a nice number:

```
>>> 1.niceNumberAbove
1
```

* * *

See also: niceNumberNear

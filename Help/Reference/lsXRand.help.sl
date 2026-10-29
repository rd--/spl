# lsXRand

- _lsXRand(list)_

Answer randomly selected items from _list_,
however do not answer the same item twice in succession.

```
>>> lsXRand(
>>> 	[1 3 5 7 9],
>>> 	99,
>>> 	Sfc32(890142)
>>> ).upToEnd
>>> .differentiate
>>> .includes(0)
>>> .not
true
```

Compare to `lsRand`

```
>>> lsRand(
>>> 	[1 3 5 7 9],
>>> 	99,
>>> 	Sfc32(890142)
>>> )
>>> .upToEnd
>>> .differentiate
>>> .includes(0)
true
```

Equivalent to `lsRemDup` of `lsRand`:

```
>>> lsRemDup(
>>> 	lsRand(
>>> 		[1 3 5 7 9],
>>> 		99,
>>> 		Sfc32(898714)
>>> 	)
>>> ).upToEnd
>>> .differentiate
>>> .includes(0)
>>> .not
true
```

Randomly select from a list of odd integers avoiding immediate repeats:

~~~spl svg=A
lsXRand(
	[1 3 5 7 9],
	37,
	Sfc32(473992)
).upToEnd
.stepPlot
~~~

![](Help/Image/lsXRand-A.svg)

* * *

See also: lsRand, lsRemDup

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pxrand.html)

Categories: Stream

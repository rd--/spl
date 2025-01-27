# LsXRand

- _LsXRand(list)_

Answer randomly selected items from _list_,
however do not answer the same item twice in succession.

```
>>> LsXRand(
>>> 	[1 3 5 7 9],
>>> 	99,
>>> 	Sfc32(890142)
>>> ).upToEnd
>>> .differentiate
>>> .includes(0)
>>> .not
true
```

Compare to `LsRand`

```
>>> LsRand(
>>> 	[1 3 5 7 9],
>>> 	99,
>>> 	Sfc32(890142)
>>> )
>>> .upToEnd
>>> .differentiate
>>> .includes(0)
true
```

Equivalent to `LsRemDup` of `LsRand`:

```
>>> LsRemDup(
>>> 	LsRand(
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

Plot:

~~~spl svg=A
LsXRand(
	[1 3 5 7 9],
	37,
	Sfc32(473992)
).upToEnd
.stepPlot
~~~

![](sw/spl/Help/Image/LsXRand-A.svg)

* * *

See also: LsRand, LsRemDup

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pxrand.html)

Categories: Stream

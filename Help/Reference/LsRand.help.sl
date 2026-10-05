# LsRand

- _LsRand(c, r)_
- _LsRand(c, k, r)_

Select elements from the collection _c_ at random accoring to the random number generator _r_.

```
>>> LsRand([1 3 5 7 9], 99, Sfc32(891423))
>>> .upToEnd
>>> .IdentitySet
[1 3 5 7 9].IdentitySet
```

The ternary form is equivalent to `take` _k_ of the binary form:

```
>>> LsRand([1 3 5 7 9], Sfc32(891423))
>>> .take(99)
>>> .upToEnd.IdentitySet
IdentitySet[1 3 5 7 9]
```

Can be implemented using `BlockStream` and `atRandom`:

```
>>> BlockStream {
>>> 	[1 3 5 7 9].atRandom
>>> } {
>>> }.take(99)
>>> .upToEnd
>>> .IdentitySet
IdentitySet[1 3 5 7 9]
```

Randomly select from a list of odd integers:

~~~spl svg=A
LsRand(
	[1 3 5 7 9],
	47,
	Sfc32(789142)
).upToEnd
.stepPlot
~~~

![](Help/Image/LsRand-A.svg)

* * *

See also: atRandom, BlockStream, LsXRand, LsWhite

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Prand.html)

Categories: Stream

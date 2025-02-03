# LsRand

- _LsRand(aCollection, randomNumberGenerator)_
- _LsRand(α, β, gamma)_ ⟹ LsRand(α, gamma).take(β)

Select elements from _aCollection_ at random.

```
>>> LsRand([1 3 5 7 9], 99, Sfc32(891423))
>>> .upToEnd
>>> .asIdentitySet
[1 3 5 7 9].asIdentitySet
```

The ternary form is equivalent to `take` of the binary form:

```
>>> LsRand([1 3 5 7 9], Sfc32(891423))
>>> .take(99)
>>> .upToEnd.asIdentitySet
[1 3 5 7 9].asIdentitySet
```

Can be implemented using `BlockStream` and `atRandom`:

```
>>> BlockStream {
>>> 	[1 3 5 7 9].atRandom
>>> } {
>>> }.take(99)
>>> .upToEnd
>>> .asIdentitySet
[1 3 5 7 9].asIdentitySet
```

Plot:

~~~spl svg=A
LsRand(
	[1 3 5 7 9],
	47,
	Sfc32(789142)
).upToEnd
.stepPlot
~~~

![](sw/spl/Help/Image/LsRand-A.svg)

* * *

See also: atRandom, BlockStream, LsXRand, LsWhite

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Prand.html)

Categories: Stream

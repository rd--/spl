# LsRand

- _LsRand(aCollection)_
- _LsRand(α, β)_ ⟹ LsRand(α).take(β)

Select elements from _aCollection_ at random.

```
>>> LsRand([1 3 5 7 9], 99)
>>> .upToEnd
>>> .asSet
[1 3 5 7 9].asSet
```

The binary form is equivalent to `take` of the unary form:

```
>>> LsRand([1 3 5 7 9])
>>> .take(99)
>>> .upToEnd.asSet
[1 3 5 7 9].asSet
```

Can be implemented using `BlockStream` and `atRandom`:

```
>>> BlockStream {
>>> 	[1 3 5 7 9].atRandom
>>> } {
>>> }.take(99)
>>> .upToEnd
>>> .asSet
[1 3 5 7 9].asSet
```

* * *

See also: atRandom, BlockStream, LsXRand, LsWhite

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Prand.html)

Categories: Stream

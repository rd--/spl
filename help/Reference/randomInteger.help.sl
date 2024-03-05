# randomInteger

- _randomInteger(α)_ ⇒ _randomInteger(1, α)_
- _randomInteger(min, max)_
- _randomInteger(min, max, countOrShape)_

Random number generator.
Generate a random integer between _min_ and _max_.

Generate a random integer betwee one and nine, inclusive:

```
>>> 9.randomInteger.betweenAnd(1, 9)
true
```

Generate a random integer between 3 and 11, inclusive:

```
>>> 3.randomInteger(11).betweenAnd(3, 11)
true
```

At `LargeInteger`:

```
>>> (2n ^ 99n).digitLength
13

>>> (2n ^ 99n).randomInteger.betweenAnd(1n, 633825300114114700748351602688n)
true

>>> (2n ^ 98).randomInteger(2n ^ 99).betweenAnd(2n ^ 98, 2n ^ 99)
true
```

The ternary form answers a List of _countOrShape_ random numbers.

A `List` of 13 random integers:

```
>>> let l = 1.randomInteger(9, 13);
>>> (l.size, l.allSatisfy { :each | each.betweenAnd(1, 9) })
(13, true)
```

A 3×4 matrix of random integers:

```
>>> let l = 1.randomInteger(9, [3 4]);
>>> (l.shape, l.allSatisfy { :each | each.sum.betweenAnd(4 * 1, 4 * 9) })
([3 4], true)
```

* * *

See also: atRandom, randomFloat, randomSample

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomInteger.html)

Categories: Random

# atRandom

- _atRandom(anInteger | aCollection | anInterval, aRandom)_

Select an element at random,
or a `List` of _count_ random items.

At `Range`:

```
>>> let c = 1:5;
>>> c.includes(c.atRandom)
true
```

At `List`:

```
>>> let c = [1 .. 5];
>>> c.includes(c.atRandom)
true
```

At `Record`:

```
>>> let c = (x: 1, y: 2);
>>> c.values.includes(c.atRandom)
true
```

At `Bag`:

```
>>> let c = [1 .. 5].asBag;
>>> c.includes(c.atRandom)
true
```

At `Set`:

```
>>> let c = [1 .. 5].asSet;
>>> c.includes(c.atRandom)
true
```

At `Integer`, select between one and five at random:

```
>>> let i = 5.atRandom;
>>> i.isInteger & { i >= 1 & { i <= 5 } }
true
```

At `Interval`, select between one and five at random:

```
>>> let i = Interval(1, 5).atRandom;
>>> i.isSmallFloat & { i >= 1 & { i <= 5 }}
true
```

* * *

See also: anyOne, randomInteger, randomSample

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomChoice.html)

Categories: Random

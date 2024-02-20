# atRandom

- _atRandom(anInteger | aCollection)_
- _atRandom(anInteger | aCollection, count)_

Select an element of _aCollection_ or an integer in the range _1_ through _anInteger_ at random,
or a List of _count_ random items.

```
>>> let c = [1 .. 5];
>>> c.includes(c.atRandom)
true

>>> let c = 1:5;
>>> c.includes(c.atRandom)
true

>>> let c = (x: 1, y: 2);
>>> c.values.includes(c.atRandom)
true

>>> let c = [1 .. 5].asBag;
>>> c.includes(c.atRandom)
true

>>> let c = [1 .. 5].asSet;
>>> c.includes(c.atRandom)
true
```

Select an integer between one and five at random:

```
>>> let i = 5.atRandom;
>>> i >= 1 & { i <= 5 }
true
```

* * *

See also: anyOne, randomInteger, randomSample

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomChoice.html)

Categories: Random selection

# atRandom

- _atRandom(anInteger | aCollection, aRandom)_

Select an element at random.

At `Range` of integer values:

```
>>> let r = Sfc32(48051);
>>> { 1:9.atRandom(r) } ! 9
[7 8 6 2 2 3 8 5 6]
```

At `Range` of real values:

```
>>> let r = Sfc32(87425);
>>> { (1, 1.1 .. 5).atRandom(r) } ! 9
[2.8 2.7 4.0 4.5 4.9 3.5 2.3 1.3 4.5]
```

At `List`:

```
>>> let r = Sfc32(23984);
>>> { [1 3 5 7 9].atRandom(r) } ! 9
[5 7 3 3 1 9 7 1 5]
```

At `Record`:

```
>>> let r = Sfc32(19401);
>>> let c = (w: 0, x: 1, y: 2, z: 3);
>>> { c.atRandom(r) } ! 9
[1 0 3 0 3 2 2 3 2]
```

At `Bag` makes a weighted choice:

```
>>> let r = Sfc32(13952);
>>> let c = [1 3 3 3 5 5 5 5 5].asBag;
>>> { c.atRandom(r) } ! 9
[3 3 5 5 5 5 3 5 1]
```

At `Set`:

```
>>> let r = Sfc32(31052);
>>> let c = [1 .. 9].asSet;
>>> { c.atRandom(r) } ! 9
[4 8 5 8 3 9 3 7 2]
```

At `Integer`, select between one and five at random:

```
>>> let r = Sfc32(52137);
>>> { 5.atRandom(r) } ! 9
[4 1 1 2 4 5 2 3 2]
```

At `Interval`, select between one and five at random:

```
>>> let r = Sfc32(69197);
>>> let i = Interval(1, 5);
>>> { i.atRandom(r) } ! 9
[1.8204 2.7704 2.1866 1.3028 4.5151 4.1276 3.5125 3.73189 1.7797]
```

* * *

See also: anyOne, randomChoice, randomInteger, randomSample

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomChoice.html)

Categories: Random

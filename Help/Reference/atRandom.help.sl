# atRandom

- _atRandom(anObject, shape, aRandomNumberGenerator)_

Select elements at random.

At `Range` of integer values:

```
>>> let r = Sfc32(48051);
>>> 1:9.atRandom([3 3], r)
[
	7 8 6;
	2 2 3;
	8 5 6
]
```

At `Range` of real values:

```
>>> let r = Sfc32(87425);
>>> (1, 1.1 .. 5).atRandom([3 3], r)
[
	2.8 2.7 4.0;
	4.5 4.9 3.5;
	2.3 1.3 4.5
]
```

At `List`:

```
>>> let r = Sfc32(23984);
>>> [1 3 5 7 9].atRandom([3 3], r)
[
	5 7 3;
	3 1 9;
	7 1 5
]
```

At `Record`:

```
>>> let r = Sfc32(19401);
>>> let c = (w: 0, x: 1, y: 2, z: 3);
>>> c.atRandom([3 3], r)
[
	1 0 3;
	0 3 2;
	2 3 2
]
```

At `Bag` makes a weighted choice:

```
>>> let r = Sfc32(13952);
>>> let c = [1 3 3 3 5 5 5 5 5].asBag;
>>> c.atRandom([3 3], r)
[
	3 3 5;
	5 5 5;
	3 5 1
]
```

At `Set`:

```
>>> let r = Sfc32(31052);
>>> let c = [1 .. 9].asSet;
>>> c.atRandom([3 3], r)
[
	4 8 5;
	8 3 9;
	3 7 2
]
```

At `Integer`, select between `one` and five at random:

```
>>> let r = Sfc32(52137);
>>> 5.atRandom([3 3], r)
[
	4 1 1;
	2 4 5;
	2 3 2
]
```

At `SmallFloat`, select between `zero` and `pi` at random:

```
>>> let r = Sfc32(83014);
>>> pi.atRandom([3 3], r)
[
	1.79715 1.06430 0.23637;
	1.53715 1.10037 2.02229;
	2.80041 1.06986 0.46743
]
```

At `Interval`, select between `one` and five at random:

```
>>> let r = Sfc32(69197);
>>> let i = (1 -- 5);
>>> i.atRandom([3 3], r)
[
	1.8204 2.7704 2.1866;
	1.3028 4.5151 4.1276;
	3.5125 3.7319 1.7797
]
```

At `Complex`:

```
>>> let r = Sfc32(69197);
>>> 10J10.atRandom([3 2], r)
[
	2.05088J6.28115 4.42597J6.82972;
	2.96642J1.94917 0.75707J3.25880;
	8.78787J0.40132 7.81907J3.01507
]
```

* * *

See also: anyOne, randomChoice, randomInteger, randomReal, randomSample, randomVariate, randomWeightedChoice

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomChoice.html)

Categories: Random

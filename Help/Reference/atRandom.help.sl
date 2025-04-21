# atRandom

- _atRandom(anObject)_

Select elements at random.

At `LargeInteger`, select between `one` and five at random:

```
>>> system.seedRandom(52137);
>>> { 5L.atRandom } ! [3 3]
[
	4 1 1;
	2 4 5;
	2 3 2
]
```

At `SmallFloat`, select between `zero` and `pi` at random:

```
>>> system.seedRandom(83014);
>>> { 1.pi.atRandom } ! [3 3]
[
	1.79715 1.06430 0.23637;
	1.53715 1.10037 2.02229;
	2.80041 1.06986 0.46743
]
```

At `Interval`, select between `one` and five at random:

```
>>> let i = 1 -- 5;
>>> system.seedRandom(69197);
>>> { i.atRandom } ! [3 3]
[
	1.8204 2.7704 2.1866;
	1.3028 4.5151 4.1276;
	3.5125 3.7319 1.7797
]
```

Plot at `Interval`:

~~~spl svg=A
let i = 1 -- 5;
system.seedRandom(297142);
(
	{ i.atRandom } ! [43]
).stepPlot
~~~

![](sw/spl/Help/Image/atRandom-A.svg)

* * *

See also: anyOne, randomChoice, randomInteger, randomReal, randomSample, randomVariate, randomWeightedChoice

Guides: Random Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomChoice.html)

Categories: Random

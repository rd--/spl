# atRandom

- _atRandom(x)_

Select elements at random from the collection or collection-like object _x_.

At a `Range` of `Integer` values,
select one at random:

```
>>> system.seedRandom(52137);
>>> { 1L:5L.atRandom } ! [3 3]
[
	4 1 1;
	2 4 5;
	2 3 2
]
```

At an `Interval` with `Float` boundaries,
select between the left and right boundaries at random:

```
>>> system.seedRandom(83014);
>>> { (0.0 -- 1.pi).atRandom } ! [3 3]
[
	1.79715 1.06430 0.23637;
	1.53715 1.10037 2.02229;
	2.80041 1.06986 0.46743
]

>>> let i = 1.0 -- 5.0;
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
let i = 1.0 -- 5.0;
system.seedRandom(297142);
(
	{ i.atRandom } ! [43]
).stepPlot
~~~

![](Help/Image/atRandom-A.svg)

* * *

See also: anyOne, randomChoice, randomReal, randomSample, randomSmallInteger, randomVariate, randomWeightedChoice

Guides: Random Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomChoice.html)

Categories: Random

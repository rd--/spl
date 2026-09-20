# randomWeightedIndex

- _randomWeightedIndex([x₁ x₂ …])_

Answer an index into the sequence _x_, where _x_ are numbers that sum to one.
The probablity of an index being drawn is given by the weight of that index in _x_.

Plot one hundred draws, ~10% will be 1, ~60% will be 2, ~30% will be 3:

~~~spl svg=A
let r = Sfc32(37914);
(
	{
		r.randomWeightedIndex(
			[0.1, 0.6, 0.3]
		)
	} ! 100
).linePlot
~~~

![](Help/Image/randomWeightedIndex-A.svg)

* * *

See also: atRandom, nextRandomFloat

Guides: Random Functions

Categories: Random

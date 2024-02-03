# betweenAnd

- _betweenAnd(self, min, max)_

Is _self_ between (inclusively) _min_ and _max_?

	3.betweenAnd(1, 5) = true
	0:6.collect { :each | each.betweenAnd(1, 5) } = [false true true true true true false]

* * *

See also: <=, >=, exclusivelyBetweenAnd, inclusivelyBetweenAnd

Categories: Comparing

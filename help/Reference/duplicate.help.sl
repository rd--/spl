# duplicate

- _duplicate(aBlock:/0, count)_
- _duplicate(x)_ ⟹ _duplicate(x, 2)_

Evaluate _aBlock_ _count_ times and collect the results into an Array.

	{ 1 }.duplicate(3) = [1 1 1]
	{ 1.duplicate(3) }.ifError { true }

* * *

See also: replicate

Categories: Copying

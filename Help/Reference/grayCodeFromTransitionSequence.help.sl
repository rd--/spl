# grayCodeFromTransitionSequence

- _grayCodeFromTransitionSequence([x₁ x₂ …])_

Answer the binary Gray code specified by the transition sequence _x_,
where _xₙ_ tells which bit in transitioned at the step _n+1_.

The 2-bit Gray code:

```
>>> [2 1 2 1]
>>> .grayCodeFromTransitionSequence
[0 0; 0 1; 1 1; 1 0]
```

Derive a 5-bit Gray code from a transition sequence,
confirm the sequence is a Beckett-Gray code:

```
>>> let c = [
>>> 	1 2 1 3 1 2 4 3 1 2
>>> 	1 5 4 3 2 1 5 4 5 3
>>> 	2 4 3 4 5 1 5 2 3 4
>>> 	1 5
>>> ].grayCodeFromTransitionSequence;
>>> (c, c.isBeckettGrayCode)
(
	[
		0 0 0 0 0;
		1 0 0 0 0;
		1 1 0 0 0;
		0 1 0 0 0;
		0 1 1 0 0;
		1 1 1 0 0;
		1 0 1 0 0;
		1 0 1 1 0;
		1 0 0 1 0;
		0 0 0 1 0;
		0 1 0 1 0;
		1 1 0 1 0;
		1 1 0 1 1;
		1 1 0 0 1;
		1 1 1 0 1;
		1 0 1 0 1;
		0 0 1 0 1;
		0 0 1 0 0;
		0 0 1 1 0;
		0 0 1 1 1;
		0 0 0 1 1;
		0 1 0 1 1;
		0 1 0 0 1;
		0 1 1 0 1;
		0 1 1 1 1;
		0 1 1 1 0;
		1 1 1 1 0;
		1 1 1 1 1;
		1 0 1 1 1;
		1 0 0 1 1;
		1 0 0 0 1;
		0 0 0 0 1
	],
	true
)
```

* * *

See also: GrayCode, isGrayCode, isBeckettGrayCode

Guides: List Functions

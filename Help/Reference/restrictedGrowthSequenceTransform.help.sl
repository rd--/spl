# restrictedGrowthSequenceTransform

- _restrictedGrowthSequenceTransform([x₁ x₂ …])_

Restricted growth sequence transform of Per Nørgård’s infinity sequence,
OEIS [A323907](https://oeis.org/A323907):

```
>>> 22.noergaardInfinitySequence
>>> .restrictedGrowthSequenceTransform
[1 2 3 4 2 1 5 6 3 4 1 2 4 3 7 8 2 1 5 6 1 2]
```

Restricted growth sequence transform of Per Nørgård’s infinity sequence,
OEIS [A323907](https://oeis.org/A323907):

~~~spl svg=A oeis=A323907
85.noergaardInfinitySequence
.restrictedGrowthSequenceTransform
.discretePlot
~~~

![](sw/spl/Help/Image/restrictedGrowthSequenceTransform-A.svg)

Restricted growth sequence transform of the ordered pair of two-adic and three-adic valuations,
OEIS [A322026](https://oeis.org/A322026):

~~~spl svg=B oeis=A322026
1:65.collect { :n |
	[
		n.integerExponent(2),
		n.integerExponent(3)
	]
}.restrictedGrowthSequenceTransform
.discretePlot
~~~

![](sw/spl/Help/Image/restrictedGrowthSequenceTransform-B.svg)

* * *

See also: boustrophedonTriangle, eulerTransform, triangularArray

Guides: Integer Sequence Functions

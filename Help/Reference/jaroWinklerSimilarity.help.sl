# jaroWinklerSimilarity

- _jaroWinklerSimilarity(s₁, s₂, p=0.1)_

Answer the Jaro-Winkler similarity between the two strings _s₁_ and _s₂_.

```
>>> jaroWinklerSimilarity(
>>> 	'accomodate', 'accommodate', 0.1
>>> )
1/55

>>> jaroWinklerSimilarity(
>>> 	'definately', 'definitely', 0.1
>>> )
1/25

>>> jaroWinklerSimilarity(
>>> 	'goverment', 'government', 0.1
>>> )
4/75

>>> jaroWinklerSimilarity(
>>> 	'occured', 'occurred', 0.1
>>> )
1/40
```

* * *

See also: editDistance, jaroDistance

Guides: Distance Functions, Similarity Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance)

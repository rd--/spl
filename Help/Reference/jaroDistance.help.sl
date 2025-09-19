# jaroDistance

- _jaroDistance(s₁, s₂)_

Answer the Jaro disance between the two strings _s₁_ and _s₂_.

```
>>> jaroDistance('Equal', 'Equal')
1

>>> jaroDistance('Equal', 'Different')
0

>>> jaroDistance('Farmville', 'Faremviel')
0.8843

>>> jaroDistance('Dwayne', 'Duane')
0.8222

>>> jaroDistance('Martha', 'Marhta')
0.9444

>>> jaroDistance('Dixon', 'Dicksonx')
0.7666
```

* * *

See also: editDistance, jaroWinklerSimilarity

Guides: Distance Functions, Similarity Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance)

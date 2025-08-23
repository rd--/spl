# counts

- _counts([x₁ x₂ …])_

Answer an association list whose keys are the distinct elements of the collection _x_,
and whose values give the number of times those elements appear.

```
>>> ['a' 'b' 'c' 'a'].counts
['a' -> 2, 'b' -> 1, 'c' -> 1]
```

Count the number of items in a random list of 100 small integers:

```
>>> let l = Sfc32(98765).next(100);
>>> (l * 3).floor.counts
[0 -> 29, 1 -> 40, 2 -> 31]
```

* * *

See also: Bag, commonest, count, sort, sortedElements, tally

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Counts.html)

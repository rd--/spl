# sequenceSplit

- _sequenceSplit([x₁ x₂ …], [y₁ …])_

Split the sequence _x_ by the sub-sequence _y_.
The separator is discarded.
Alias for `splitOn`.

At `List`:

```
>>> [1 2 3 0 0 4 5 6 0 0 7 8 9]
>>> .sequenceSplit([0 0])
[1 2 3; 4 5 6; 7 8 9]
```

* * *

See also: splitOn

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SequenceSplit.html)

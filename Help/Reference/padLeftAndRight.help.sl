# padLeftAndRight

- _padLeftAndRight([x₁ x₂ …], n, y)_

Answer a sequence of size _n_ by prefixing and suffixing the sequence _x_ with copies of the object _y_.

For cases where the size of _x_ and _n_ are either both odd or both even the answer is truly centered:

```
>>> [1 2 3].padLeftAndRight(9, 0)
[0 0 0 1 2 3 0 0 0]

>>> [1 2 3 4].padLeftAndRight(12, 0)
[0 0 0 0 1 2 3 4 0 0 0 0]
```

For mismatches biases leftwards:

```
>>> [1 2 3].padLeftAndRight(8, 0)
[0 0 1 2 3 0 0 0]

>>> [1 2 3 4].padLeftAndRight(11, 0)
[0 0 0 1 2 3 4 0 0 0 0]
```

* * *

See also: #, ++, arrayPad, padLeft, padRight, size

Guides: List Functions

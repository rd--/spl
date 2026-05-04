# prefixProduct

- _prefixProduct([x₁ x₂ …])_

Answer the prefix product of _x_.

```
>>> [1 2 3 4 5 6].prefixProduct
[1 2 6 24 120 720]

>>> [1 2 3 4 5 6].scanLeft(*)
[1 2 6 24 120 720]
```

The right scan is called `suffixProduct`:

```
>>> [2 3 4 5 6].suffixProduct
[720 360 120 30 6]

>>> [2 3 4 5 6].scanRight(*)
[720 360 120 30 6]
```

* * *

See also: prefixSum, scanLeft, suffixProduct

Guides: List Functions

# binaryContraction

- _binaryContraction([b₁ b₂ …])_

Answer the binary contraction of _b_,
called binary words or binary vectors.

```
>>> [1 0 1 1 0 0 1 1 1 0 0 0 1 1 1 1]
>>> .binaryContraction
45967

>>> 45967.binaryExpansion
[1 0 1 1 0 0 1 1 1 0 0 0 1 1 1 1]
```

Threads over lists,
OEIS [A007283](https://oeis.org/A007283):

```
>>> (11 * (10 ^ 0:9))
>>> .integerDigits
>>> .binaryContraction
[3 6 12 24 48 96 192 384 768 1536]
```

* * *

See also: binaryExpansion, fromDigits

Guides: Integer Functions

# fastWalshHadamardTransform

- _fastWalshHadamardTransform(aSequence)_

In place Fast Walsh-Hadamard Transform without normalization using Hadamard ordering.
Operates only on signals with length equal to a power of two.
If the length is less than a power of two, pad with zeros to the next greater power of two before processing.

```
>>> [1 0 1 0 0 1 1 0]
>>> .fastWalshHadamardTransform / 8
[0.5 0.25 0 -0.25 0 0.25 0 0.25]

>>> [1 1 1 1 0 0 0 0]
>>> .fastWalshHadamardTransform / 8
[0.5 0 0 0 0.5 0 0 0]

>>> [19 -1 11 -9 -7 13 -15 5]
>>> .fastWalshHadamardTransform / 8
[2 0 4 0 3 10 0 0]
```

* * *

See also: hadamardMatrix, walshMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/x.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/fwht.html)

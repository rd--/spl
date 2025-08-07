# fastWalshHadamardTransform

- _fastWalshHadamardTransform([x₁ x₂ …])_

In place Fast Walsh-Hadamard Transform,
without normalization,
using Hadamard ordering.
Operates only on signals with length equal to a power of two.
If the length is less than a power of two, pad with zeros to the next greater power of two before processing.

```
>>> [1 0 1 0 0 1 1 0]
>>> .fastWalshHadamardTransform
[4 2 0 -2 0 2 0 2]

>>> [1 1 1 1 0 0 0 0]
>>> .fastWalshHadamardTransform
[4 0 0 0 4 0 0 0]

>>> [19 -1 11 -9 -7 13 -15 5]
>>> .fastWalshHadamardTransform / 8
[2 0 4 0 3 10 0 0]
```

Automatically pads with zeros to the nearest power of two:

```
>>> [1 1 1 1 1]
>>> .fastWalshHadamardTransform
[5 1 1 1 3 -1 -1 -1]

>>> [1 1 1 1 1 0 0 0]
>>> .fastWalshHadamardTransform
[5 1 1 1 3 -1 -1 -1]
```

Self-inverse when normalized:

```
>>> [0.5 0 0 0 0.5 0 0 0]
>>> .fastWalshHadamardTransform
[1 1 1 1 0 0 0 0]
```

Equal to the `dot` product of the signal with a Hadamard matrix:

```
>>> let m = 8.hadamardMatrix;
>>> [1 0 1 0 0 1 1 0].dot(m)
[4 2 0 -2 0 2 0 2]

>>> [1 0 1 0 0 1 1 0]
>>> .fastWalshHadamardTransform
[4 2 0 -2 0 2 0 2]
```

* * *

See also: hadamardMatrix, walshMatrix

Guides: Signal Processing Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WalshTransform.html)
[2](https://mathworld.wolfram.com/FastWalshTransform.html)
[3](https://mathworld.wolfram.com/WalshFunction.html)
[4](https://reference.wolfram.com/language/ref/DiscreteHadamardTransform.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/fwht.html),
_W_
[1](https://en.wikipedia.org/wiki/Walsh%E2%80%93Hadamard_transform)
[2](https://en.wikipedia.org/wiki/Fast_Walsh%E2%80%93Hadamard_transform)

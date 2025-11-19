# walshFunction

- _walshFunction(n, k)_

Answer the _k_-th Walsh function of length _2^n_,
which is the _k_-th row of the _2^n_ Walsh matrix.

The _2,4_ Walsh function:

```
>>> walshFunction(2, 4)
[1 -1 1 -1]

>>> (2 ^ 2).walshMatrix.at(4)
[1 -1 1 -1]
```

The _3,6_ Walsh function:

```
>>> walshFunction(3, 6)
[1 -1 -1 1 -1 1 1 -1]

>>> (2 ^ 3).walshMatrix.at(6)
[1 -1 -1 1 -1 1 1 -1]
```

* * *

See also: hadamardMatrix, walshMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WalshFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Walsh_function)

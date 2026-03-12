# characteristicFunction

- _characteristicFunction([n₁ n₂ …], i=1:⌈n)_
- _characteristicFunction(f:/2, n:m)_

At a `Collection` _n_,
answer the sequence with indices _i_ where each place is `one` if _i_ is in _n_ else `zero`.

```
>>> [2 4 6 8 10].characteristicFunction
[0 1 0 1 0 1 0 1 0 1]

>>> [0 2 4 5 7 9 11]
>>> .characteristicFunction(0:11)
[1 0 1 0 1 1 0 1 0 1 0 1]
```

`indicesOf` can recover the sequence from the characteristic function:

```
>>> [0 1 0 1 0 1 0 1 0 1].indicesOf(1)
[2 4 6 8 10]

>>> [1 0 1 0 1 1 0 1 0 1 0 1]
>>> .indicesOf(1) - 1
[0 2 4 5 7 9 11]
```

At a `Block` _f_,
answer the sequence with indices in _n:m_ where each place is `one` if _f(i)_ is `true` else `zero`.

The characteristic function of even numbers,
OEIS [A059841](https://oeis.org/A059841)

```
>>> isEven:/1.characteristicFunction(0:21)
[1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0]
```

The characteristic function of odd numbers,
OEIS [A000035](http://oeis.org/A000035):

```
>>> isOdd:/1.characteristicFunction(0:21)
[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1]
```

* * *

See also: boole, collect

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CharacteristicFunction.html)
[2](https://mathworld.wolfram.com/IversonBracket.html)

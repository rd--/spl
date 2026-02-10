# boustrophedonTransform

- _boustrophedonTransform([x₁ x₂ …])_

Answer the boustrophedon transform of the sequence _x_.

The boustrophedon transform of `one` and then `zero`,
equal to the `eulerUpDownNumber`,
OEIS [A000111](https://oeis.org/A000111):

```
>>> [1 0 0 0 0 0 0 0 0 0 0]
>>> .boustrophedonTransform
[1 1 1 2 5 16 61 272 1385 7936 50521]
```

The boustrophedon transform of `one` repeated,
OEIS [A000667](https://oeis.org/A000667):

```
>>> [1 1 1 1 1 1 1 1 1 1 1]
>>> .boustrophedonTransform
[1 2 4 9 24 77 294 1309 6664 38177 243034]
```

The boustrophedon transform of `one` and negative one repeating,
OEIS [A062162](https://oeis.org/A062162):

```
>>> [1 -1 1 -1 1 -1 1 -1 1 -1 1 -1]
>>> .boustrophedonTransform
[1 0 0 1 0 5 10 61 280 1665 10470 73621]
```

The boustrophedon transform from the `prime` numbers,
OEIS [A000747](https://oeis.org/A000747):

```
>>> [2 3 5 7 11 13 17 19 23 27]
>>> .boustrophedonTransform
[2 5 13 35 103 345 1325 5911 30067 172237]
```

The boustrophedon transform of the `fibonacci` numbers,
OEIS [A000744](https://oeis.org/A000744):

```
>>> [1 1 2 3 5 8 13 21 34 55]
>>> .boustrophedonTransform
[1 2 5 14 42 144 563 2526 12877 73778]
```

The boustrophedon transform of the `factorial` numbers,
OEIS [A230960](https://oeis.org/A230960):

```
>>> [1 1 2 6 24 120 720 5040 40320]
>>> .boustrophedonTransform
[1 2 5 17 73 381 2347 16701 134993]
```

Of composite numbers,
OEIS [A230954](https://oeis.org/A230954):

```
>>> 2:17.reject(isPrime:/1)
>>> .boustrophedonTransform
[4 10 24 59 162 526 2016 8978 45696]
```

Of non-prime numbers,
OEIS [A230955](https://oeis.org/A230955):

```
>>> 1:17.reject(isPrime:/1)
>>> .boustrophedonTransform
[1 5 15 40 114 371 1422 6334 32238 184655]
```

Of Hamming weight,
OEIS [A230952](https://oeis.org/A230952):

```
>>> 0:10.hammingWeight
>>> .boustrophedonTransform
[0 1 3 8 23 72 280 1242 6331 36236 230726]
```

* * *

See also: boustrophedonTriangle, eulerTransform, triangularArray

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BoustrophedonTransform.html),
_OEIS_
[1](https://oeis.org/A000111)
[2](https://oeis.org/A000667)
[3](https://oeis.org/A062162)
[4](https://oeis.org/A000747)
[5](https://oeis.org/A000744)
[6](https://oeis.org/A230960),
_W_
[1](https://en.wikipedia.org/wiki/Boustrophedon_transform)

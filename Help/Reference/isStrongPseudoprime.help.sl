# isStrongPseudoprime

- _isStrongPseudoprime(n, b)_

First few terms where _b=2_,
OEIS [A001262](https://oeis.org/A001262):

```
>>> 2:9000.select { :n |
>>> 	n.isStrongPseudoprime(2)
>>> }
[2047 3277 4033 4681 8321]
```

First few terms where _b=3_,
OEIS [A020229](https://oeis.org/A020229):

```
>>> 2:9000.select { :n |
>>> 	n.isStrongPseudoprime(3)
>>> }
[121 703 1891 3281 8401 8911]
```

First few terms where _b=4_,
OEIS [A020230](https://oeis.org/A020230):

```
>>> 2:4500.select { :n |
>>> 	n.isStrongPseudoprime(4)
>>> }
[341 1387 2047 3277 4033 4371]
```

First few terms where _b=5_,
OEIS [A020231](https://oeis.org/A020231):

```
>>> 2:8000.select { :n |
>>> 	n.isStrongPseudoprime(5)
>>> }
[781 1541 5461 5611 7813]
```

First few terms where _b=6_,
OEIS [A020232](https://oeis.org/A020232):

```
>>> 2:3000.select { :n |
>>> 	n.isStrongPseudoprime(6)
>>> }
[217 481 1111 1261 2701]
```

First few terms where _b=7_,
OEIS [A020233](https://oeis.org/A020233):

```
>>> 2:5000.select { :n |
>>> 	n.isStrongPseudoprime(7)
>>> }
[25 325 703 2101 2353 4525]
```

First few terms where _b=8_,
OEIS [A020234](https://oeis.org/A020234):

```
>>> 2:2500.select { :n |
>>> 	n.isStrongPseudoprime(8)
>>> }
[9 65 481 511 1417 2047]
```

First few terms where _b=9_,
OEIS [A020235](https://oeis.org/A020235):

```
>>> 2:1800.select { :n |
>>> 	n.isStrongPseudoprime(9)
>>> }
[91 121 671 703 1541 1729]
```

* * *

See also: isPrime

Guidess: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StrongPseudoprime.html),
_OEIS_
[1](https://oeis.org/A001262)
[2](https://oeis.org/A020229)
[3](https://oeis.org/A020230)
[4](https://oeis.org/A020231)
[5](https://oeis.org/A020232)
[6](https://oeis.org/A020233)
[7](https://oeis.org/A020234)
[8](https://oeis.org/A020235),
_W_
[1](https://en.wikipedia.org/wiki/Strong_pseudoprime)

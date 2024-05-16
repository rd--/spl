# factorial

- _factorial(anInteger)_

The `product` of `one` up to _anInteger_.

```
>>> 1:10.factorial
[1 2 6 24 120 720 5040 40320 362880 3628800]

>>> 9.factorial
1:9.product

>>> 18.factorial
6402373705728000

>>> 23n.factorial
25852016738884976640000n
```

Number of permutations of 6 elements:

```
>>> 1:6.permutations.size
720

>>> 6.factorial
720
```

Exact `LargeInteger` and inexact `SmallFloat` results for 30!:

```
>>> 30n.factorial
265252859812191058636308480000000n

>>> 30.factorial
2.652528598121911e32
```

Notable limits:

- 12! is the largest factorial that can fit into 32-bit integer.
- 18! is the largest factorial that can fit into 53-bit integer.
- 20! is the largest factorial that can fit into 64-bit integer.
- 170! is the largest factorial that can fit into a 64-bit double.

```
>>> 12.factorial.log2.floor
28

>>> 18.factorial.log2.floor
52

>>> 20.factorial.log2.floor
61
```

At `zero`:

```
>>> 0.factorial
1
```

Calculate the third to twelfth terms of OEIS [A000435](https://oeis.org/A000435):

```
>>> 3:12.collect { :n |
>>> 	(n - 1).factorial * (0 .. n - 2).collect { :k | n ^ k / k.factorial }.sum
>>> }
[8 78 944 13800 237432 4708144 105822432 2660215680 73983185000 2255828154624]
```

* * *

See also: binomial, doubleFactorial, subfactorial

References:
_Apl_
[1](https://aplwiki.com/wiki/Factorial),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bang),
_Mathematica_
[1](https://mathworld.wolfram.com/Factorial.html)
[2](https://reference.wolfram.com/language/ref/Factorial.html),
_Smalltalk_
5.6.5.11

Categories: Math

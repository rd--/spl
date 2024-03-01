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

* * *

See also: doubleFactorial

References:
_Apl_
[1](https://aplwiki.com/wiki/Factorial),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bang),
_Mathematica_
[1](https://mathworld.wolfram.com/Factorial.html)
[2](https://reference.wolfram.com/language/ref/Factorial.html)

Categories: Math

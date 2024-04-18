# doubleFactorial

- _doubleFactorial(anInteger)_

The product of the positive integers of equal parity up to _anInteger_.

```
>>> 1:10.doubleFactorial
[1 2 3 8 15 48 105 384 945 3840]
```

For even numbers, Oeis [A000165](http://oeis.org/A000165):

```
>>> (0, 2 .. 14).doubleFactorial
[1 2 8 48 384 3840 46080 645120]

>>> 14.doubleFactorial
(2, 4 .. 14).product
```

For odd numbers, Oeis [A001147](http://oeis.org/A001147):

```
>>> (1, 3 .. 13).collect(doubleFactorial:/1)
[1 3 15 105 945 10395 135135]

>>> 13.doubleFactorial
(1, 3 .. 13).product
```

Value at `zero`:

```
>>> 0.doubleFactorial
1
```

At `LargeInteger`:

```
>>> 27n.doubleFactorial
213458046676875n
```

* * *

See also: factorial, subfactorial

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DoubleFactorial.html)
[2](https://reference.wolfram.com/language/ref/Factorial2.html)

Categories: Math

# multiplicativeOrder

- _multiplicativeOrder(k, n)_

Answer the multiplicative order of _k_ modulo _n_,
defined as the smallest integer _m_ such that _(k ^ m) % n = 1_.

If _n_ is `one` answer _n_:

```
>>> 7.multiplicativeOrder(1)
1
```

`multiplicativeOrder` answers `nil` if there is no integer satisfying the necessary conditions:

```
>>> 1:4.collect { :n | 1:10.collect { :k | k.multiplicativeOrder(n) } }
[
	1 1 1 1 1 1 1 1 1 1;
	1 nil 1 nil 1 nil 1 nil 1 nil;
	1 2 nil 1 2 nil 1 2 nil 1;
	1 nil 2 nil 1 nil 2 nil 1 nil
]
```

The multiplicative order of 5 modulo 8:

```
>>> 5.multiplicativeOrder(8)
2

>>> (5 ^ 2) % 8
1
```

Compute using integers:

```
>>> 5.multiplicativeOrder(7)
6

>>> -5.multiplicativeOrder(7)
3
```

For nonzero integers _k_ and _n_, `multiplicativeOrder` exists if and only if _k_ and _n_ are coprime:

```
>>> 10.isCoprime(21)
true

>>> 10.multiplicativeOrder(21)
6

>>> 21.multiplicativeOrder(10)
1
```

However, 10 and 22 are not coprime:

```
>>> 10.multiplicativeOrder(22)
nil
```

`eulerPhi` divides `multiplicativeOrder`:

```
>>> 12.eulerPhi
4

>>> 5.multiplicativeOrder(12)
2

>>> 4.divisible(2)
true
```

The answer is always positive:

```
>>> 5.multiplicativeOrder(3)
2

>>> -5.multiplicativeOrder(3)
1
```

Find the smallest integer such that _5 ^ m % 7_ is either 2, 3, or 4:

```
>>> 5.multiplicativeOrder(7, [2 3 4])
2
```

Find which of the remainders above was matched:

```
>>> 5.powerMod(2, 7)
4

>>> 5.multiplicativeOrder(7, [4])
2
```

Solve the discrete log problem with _5 ^ m % 7 = 4:

```
>>> 5.multiplicativeOrder(7, [4])
2

>>> 5 ^ 2 % 7
4
```

Plot the sequence with a fixed modulus:

~~~
1:50.functionPlot { :k | k.multiplicativeOrder(7) ? { 0 } }
~~~

Plot the sequence, varying the modulus:

~~~
1:22.functionPlot { :n | 7.multiplicativeOrder(n) ? { 0 } }
~~~

* * *

See also: %, eulerPhi, powerMod

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DiscreteLogarithm.html)
[2](https://reference.wolfram.com/language/ref/MultiplicativeOrder.html?view=all)

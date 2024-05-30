# eulerPhi

- _eulerPhi(n)_

Answer the Euler totient function.
Also known as the Euler totient function or phi function.
Counts positive integers up to _n_ that are relatively prime to _n_.

Compute the Euler totient function:

```
>>> 10.eulerPhi
4

>>> 17400.eulerPhi
4480
```

Negative numbers:

```
>>> -10.eulerPhi
4
```

Threads over lists:

```
>>> [2 4 6].eulerPhi
[1 2 2]
```

Length of the _nth_-order Farey sequence can be expressed in terms of `eulerPhi`,
c.f. OEIS [A002088](https://oeis.org/A002088):

```
>>> 1:15.collect { :k | 1:k.eulerPhi.sum + 1 }
[2 3 5 7 11 13 19 23 29 33 43 47 59 65 73]
```

EulerPhi is non-negative:

```
>>> 0.eulerPhi
0
```

For any square-free number _n_,
the totient of _n_ is equal to the `product` of the totients of each factor of _n_:

```
>>> 1023.eulerPhi
(3.eulerPhi * 11.eulerPhi * 31.eulerPhi)
```

Plot the sequence:

~~~
1:100.collect(eulerPhi:/1).plot
~~~

Plot the cumulative `sum` of `eulerPhi`:

~~~
1:50.eulerPhi.prefixSum.plot
~~~

* * *

See also: divisors, factorInteger, gcd, lcm, powerMod

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/pco#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/TotientFunction.html)
[2](https://reference.wolfram.com/language/ref/EulerPhi.html),
_OEIS_
[1](https://oeis.org/A002088)

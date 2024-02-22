# eulerPhi

_eulerPhi(n)_

Answer the Euler totient function.
Also known as the Euler totient function or phi function.
Counts positive integers up to _n_ that are relatively prime to _n_.

Compute the Euler totient function of ten:

```
>>> 10.eulerPhi
4
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

Length of the _nth_-order Farey sequence can be expressed in terms of _eulerPhi_:

```
>>> 1:15.collect { :k | 1:k.eulerPhi.sum + 1 }
[2 3 5 7 11 13 19 23 29 33 43 47 59 65 73]
```

EulerPhi is non-negative:

```
>>> 0.eulerPhi
0
```

For any square-free number n, the totient of n is equal to the product of the totients of each factor of n :

```
>>> 1023.eulerPhi
(3.eulerPhi * 11.eulerPhi * 31.eulerPhi)
```

Plot the sequence:

~~~
1:100.collect(eulerPhi:/1).plot
~~~

Plot the cumulative sum of eulerPhi:

~~~
1:50.eulerPhi.prefixSum.plot
~~~

* * *

See also: divisors, factorInteger, gcd, lcm, powerMod

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TotientFunction.html)
[2](https://reference.wolfram.com/language/ref/EulerPhi.html)

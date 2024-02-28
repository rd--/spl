# nextPrime

- _nextPrime(anInteger)_

Answer the least integer that is greater than _anInteger_ and is prime.

```
>>> (2 ^ 6).nextPrime
67

>>> 31243.nextPrime
31247

>>> 17393.nextPrime
17401

>>> 2971215073.nextPrime
2971215083

>>> 2971215083.isPrime
true
```

Find twin primes, i.e. pairs of primes of the form _(p, p + 2)_:

```
>>> 1:100.select { :n | n.isPrime & { n.nextPrime = (n + 2) } }
[3  5 11 17 29 41 59 71]
```

Plot the sequence of primes:

~~~
0:50.collect { :x | x.nextPrime }.plot
~~~

* * *

See also: isPrime

References:
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=nextprime),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NextPrime.html)

Categories: Arithmetic

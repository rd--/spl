# divisorSum

- _divisorSum(anInteger, aBlock:/1)_

The sum of _aBlock_ at all _i_ that divide _anInteger_.

Find the sum of the divisors of :

```
>>> 30.divisorSum(identity:/1)
72
```

Plot the sum of divisors for the first 50 numbers:

~~~
1:100.collect { :n | n.divisorSum(identity:/1) }.plot
~~~

* * *

See also: divisors, divisorSigma, sum

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DivisorSum.html)

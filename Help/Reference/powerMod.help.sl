# powerMod

- _powerMod(a, b, m)_

Answers _a ^ b % m_.

```
>>> 2.powerMod(10, 3)
1

>>> 3.powerMod(2, 7)
2
```

Use `powerMod` to generate all coprime integers modulo 9:

```
>>> 2:10.collect { :each | 2.powerMod(each, 9) }.asSet.sorted
[1 2 4 5 7 8]
```

Plot the sequence with fixed powers:

~~~
1:50.functionPlot { :x | x.powerMod(2, 11) }
~~~

Plot the sequence with varying powers:

~~~
1:50.functionPlot { :x | 2.powerMod(x, 11) }
~~~

Plot a list of powers of 3 where the exponent is varied, modulo some prime number:

~~~
let n = 44.nthPrime;
1:n.functionPlot { :x | 3.powerMod(x, n) }
~~~

* * *

See also: ^, %

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PowerMod.html)

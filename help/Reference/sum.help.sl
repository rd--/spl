# sum

- _sum(aCollection)_ ⟹ _aCollection.reduce(+)_

Answer the sum of all the elements in _aCollection_.

```
>>> [1 2 3 5 7 9].sum
27

>>> [pi 1 4 e 7 8].sum
25.8599

>>> 1:9.sum
45

>>> 1:9.reduce(+)
45

>>> [1 2 3; 4 5 6; 7 8 9].collect(sum:/1)
[6 15 24]

>>> [1 2 3; 4 5 6; 7 8 9].transposed.collect(sum:/1)
[12 15 18]

>>> [1 2 3; 4 5 6; 7 8 9].sum.sum
45
```

Where supported this method is displayed as Σ.

* * *

See also: +, product, reduce

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Total.html)

Unicode: U+03A3 Σ Greek Capital Letter Sigma

Categories: Math, Operator

# detectSum

- _detectSum(c, f:/1)_

Evaluate the block _f_ with each of element of the collection _c_ as the argument and answer their sum.

```
>>> [1 3 5 7 9].detectSum(square:/1)
165

>>> [1 3 5 7 9].square.sum
165

>>> [1 3 5 7 9].sum(square:/1)
165

>>> [1 2 3 4 5].detectSum { :each |
>>> 	each.isOdd.boole
>>> }
3
```

* * *

See also: detect, sum

Categories: Enumerating

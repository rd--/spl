# sternBrocotParent

- _sternBrocotParent(n/d)_

Answer the parent of the fraction _n/d_ in the Stern-Brocot tree.

Trace the fraction _23/16_ upwards to _1/1_,
the root of the Stern-Brocot tree:

```
>>> 23/16.sternBrocotParent
13/9

>>> 13/9.sternBrocotParent
10/7

>>> 10/7.sternBrocotParent
7/5

>>> 7/5.sternBrocotParent
4/3

>>> 4/3.sternBrocotParent
3/2

>>> 3/2.sternBrocotParent
2/1

>>> 2/1.sternBrocotParent
1/1
```

Trace using `nestWhileList`:

```
>>> sternBrocotParent:/1
>>> .nestWhileList(23/16) { :x |
>>> 	x != 1/1
>>> }
[23/16 13/9 10/7 7/5 4/3 3/2 2/1 1/1]
```

The term 1/1 has no parent,
it answers itself:

```
>>> 1/1.sternBrocotParent
1/1
```

* * *

See also: continuedFraction, Fraction, fromContinuedFraction, sternBrocotChildren, sternBrocotTree

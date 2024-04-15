# <=>

- _aMagnitude <=> anotherMagnitude_

Answers a collation order of -1, 0, or 1,
indicating whether the left operand should be collated
before, equal to, or after the right operand.

Ascending:

```
>>> 1 + 1 <=> 3
-1

>>> (7 / 3).gamma <=> 2.sqrt
-1
```

Equal to:

```
>>> 1 + 1 <=> 2
0

>>> 2.pi / 2 <=> pi
0
```

Descending:

```
>>> 3 <=> 1
1

>>> e ^ 2 <=> pi
1
```

Mixed types, ascending:

```
>>> 1 <=> 3/2
-1
```

Mixed types, equal to:

```
>>> 1.5 <=> 3/2
0
```

-∞ comes before any real-valued expression:

```
>>> inf.- <=> 1.goldenRatio
-1
```

∞ comes after any real-valued expression:

```
>>> 1E53 <=> inf
-1
```

* * *

See also: ~, =, <, <=, >, >=

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NumericalOrder.html)

Categories: Comparing

# negated

- _negated(aNumber)_

Answer a number that is the negation of _aNumber_.
Equivalent to multiplication by negative `one`.

At `zero` and `one`:

```
>>> 0.negated
-0

>>> 1.negated
-1
```

At negative `zero` and negative `one`:

```
>>> -0.negated
0

>>> -1.negated
1
```

Threads over lists and matrices:

```
>>> [1 2 3].negated
[-1 -2 -3]

>>> [1 [2 3 4] [[5 6] [7 [8 9]]]].negated
[-1 [-2 -3 -4] [[-5 -6] [-7 [-8 -9]]]]
```

At `Complex`:

```
>>> [-2.5 1e20 3j-4].-
[2.5 -1e20 -3j4]
```

At `Colour`, inverts the value of the colour channels:

```
>>> let r = Colour(1, 0, 0);
>>> let c = r.negated;
>>> (r.isRed, c.isCyan)
(true, true)
```

* * *

See also: -, abs, sign

References:
_Apl_
[1](https://aplwiki.com/wiki/Negate)
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/minus),
_Mathematica_
[1](https://mathworld.wolfram.com/Negative.html)
[2](https://reference.wolfram.com/language/ref/Minus.html)
[3](https://reference.wolfram.com/language/ref/ColorNegate.html),
_Smalltalk_
5.6.2.22

Categories: Arithmetic

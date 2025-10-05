# negate

- _negate(x)_

Answer a number that is the negation of the number _x_.
Equivalent to multiplication by negative `one`.

At `zero` and `one`:

```
>>> 0.negate
-0

>>> 1.negate
-1
```

At negative `zero` and negative `one`:

```
>>> -0.negate
0

>>> -1.negate
1
```

Threads over lists and matrices:

```
>>> [1 2 3].negate
[-1 -2 -3]

>>> [1, [2, 3, 4], [[5, 6], [7, [8, 9]]]].negate
[-1, [-2, -3, -4], [[-5, -6], [-7, [-8, -9]]]]
```

At `Complex`:

```
>>> [-2.5 1E20 3J-4].-
[2.5 -1E20 -3J4]
```

At a `Colour`, inverts the value of the colour channels:

```
>>> let r = RgbColour([1, 0, 0], 1);
>>> let c = r.negate;
>>> (r.isRed, c.isCyan)
(true, true)
```

The unary operator form is `-`.

_Rationale_:
This operator is not spelled _negated_ as in Smalltalk,
where unary messages are always written postfix,
hence _1 negated_ and not _negate(1)_.

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

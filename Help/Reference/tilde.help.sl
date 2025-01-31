# ~ (tilde)

- _anObject ~ anotherObject_

Answer `true` if _anObject_ is almost equal to (or similar to or close to) _anotherObject_, else `false`.
The meaning of _close to_ is determined by the type of _anObject_.

At `SmallFloat`:

```
>>> (1.e ~ 2.7183, 1.pi ~ 3.1416)
(true, true)
```

At `Interval`:

```
>>> (1.e -- 1.pi) ~ (2.7183 -- 3.1416)
true
```

At `Complex`:

```
>>> Complex(1.e, 1.pi) ~ Complex(2.7183, 3.1416)
true
```

At `List`:

```
>>> [1.e 1.pi] ~ [2.7183 3.1416]
true
```

At `List` of `List`:

```
>>> [
>>> 	1.e 1.pi;
>>> 	1.pi 1.e
>>> ] ~ [
>>> 	2.7183 3.1416;
>>> 	3.1416 2.7183
>>> ]
true
```

At `String`:

```
>>> 'text' ~ 'text'
true
```

At `Character`,
answers true to character and the equivalent one place `String`:

```
>>> 'x'.asCharacter ~ 'x'
true

>>> 'x' ~ 'x'.asCharacter
true
```

At `Tuple`:

```
>>> (1, 2) ~ (1.000000001, 2)
true
```

The name of this operator is `tilde`.

Where supported `~` is displayed as ≈.

_Rationale_:
Writing _~_ to indicate _similar to_ is a standard mathematical notation,
as is writing _≈_ to indicate _approximately_.
However the notation is a little confusing in this context.
In Smalltalk `~=` is the operator for _not equal to_, and `~~` is the operator for _not identical to_.
If these operators were written `!=` and `!==` it may be less confusing.

* * *

See also: =, <~, >~, ~=, ~~, isCloseTo, isVeryCloseTo

References:
_Apl_
[1](https://aplwiki.com/wiki/Match)

Unicode: U+0007E ~ Tilde, U+2248 ≈ Almost Equal To

Categories: Comparing

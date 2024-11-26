# ~ (tilde)

- _anObject ~ anotherObject_

Answer `true` if _anObject_ is almost equal to (or similar to or close to) _anotherObject_, else `false`.
The meaning of _close to_ is determined by the type of _anObject_.

At `SmallFloat`:

```
>>> (e ~ 2.7183, pi ~ 3.1416)
(true, true)
```

At `Interval`:

```
>>> (e -- pi) ~ (2.7183 -- 3.1416)
true
```

At `Complex`:

```
>>> Complex(e, pi) ~ Complex(2.7183, 3.1416)
true
```

At `List`:

```
>>> [e pi] ~ [2.7183 3.1416]
true

>>> [e pi; pi e] ~ [2.7183 3.1416; 3.1416 2.7183]
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
